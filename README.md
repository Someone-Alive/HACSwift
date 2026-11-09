# HACSwift

A Swift package for interacting with Home Access Center (HAC). It signs in to a district's HAC portal, scrapes the pages with [SwiftSoup](https://github.com/scinfu/SwiftSoup), and exposes grades, assignments, transcripts, schedules and interim progress reports as Swift types that plug straight into SwiftUI.

> This package is not affiliated with PowerSchool in any way.

**Status:** Stable (current version `1.0.0`). APIs may change between releases.

## Requirements

- Swift 6.1+
- iOS 14+ / macOS 10.15+ (as declared in `Package.swift`)
- [SwiftSoup](https://github.com/scinfu/SwiftSoup) 2.7.5+ (pulled in automatically)

## Installation

Add HACSwift with Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/<your-account>/HACSwift.git", branch: "main")
],
targets: [
    .target(name: "YourApp", dependencies: ["HACSwift"])
]
```

Or in Xcode: **File → Add Package Dependencies…** and enter the repository URL.

## Quick start

```swift
import HACSwift

let session = HACSession(
    username: "student123",
    password: "••••••••",
    url: "hac.example-isd.org",          // host only — no https:// and no path
    useAnimation: true,                  // wrap @Published updates in withAnimation
    districtName: "Example ISD",
    hacName: "Example ISD",              // must match the district's option in HAC's database dropdown, if it has one
    timeoutInterval: 15
)

Task {
    guard await session.login() == .passed else { return }

    let student = await session.getUserInfo()
    print(student?.studentName ?? "Unknown")

    // Current marking period, with class grades and assignments
    let (status, current, allPeriods, params, period) =
        await session.availableMarkingPeriodsWithCurrentMarkingPeriod(
            districtWeightIdentifier: "Integrated Frisco ISD"
        )

    // Load another marking period using the params returned above
    if status == .passed, let other = allPeriods.first(where: { $0 != current }) {
        _ = await session.requestGrades(
            districtWeightIdentifier: "Integrated Frisco ISD",
            forPeriod: other,
            dictionary: params
        )
    }

    session.logout()
}
```

`HACSession` is a `@MainActor` `ObservableObject`, so you can hold it in a `@StateObject` / `@ObservedObject` and bind views directly to its published properties.

## `HACSession`

### Initializer

| Parameter | Description |
| --- | --- |
| `username`, `password` | HAC credentials. |
| `url` | The HAC **host** only, e.g. `hac.example-isd.org`. HACSwift builds `https://<url>/HomeAccess/...` itself. |
| `useAnimation` | When `true`, updates to published properties are wrapped in `withAnimation(.bouncy(duration: 0.3))`. |
| `districtName` | Display name for the district. |
| `hacName` | Used to pick the right database on HAC sign-in pages that show a district dropdown. Must match the option's text exactly. |
| `timeoutInterval` | Timeout, in seconds, for every network request. |

### Published state

| Property | Type | Filled by |
| --- | --- | --- |
| `status` | `HACSessionUserStatus` (`.loggedIn` / `.loggedOut`) | `login()`, `logout()` |
| `markingPeriods` | `[MarkingPeriod]` | `availableMarkingPeriodsWithCurrentMarkingPeriod(...)`, `requestGrades(...)` (each call appends) |
| `transcript` | `[Transcript]` | `getStudentTranscript()` |
| `transcriptGPA` | `[TranscriptGPA]` | `getStudentTranscript()` |
| `schedule` | `[Schedule]` | `getStudentSchedule()` |
| `scheduleUnique1` | `[String]` | Unique marking-period strings in the schedule |
| `scheduleUnique2` | `[String]` | Unique day strings in the schedule |
| `ipr` | `[IPR]` | `getStudentIPR(...)` |

All are read-only from outside the package.

### Methods

Every data method requires a successful `login()` first and returns `.failed` (or `nil`) otherwise. Results use `HACSessionStatus` (`.passed` / `.failed`).

| Method | Returns | Notes |
| --- | --- | --- |
| `login()` | `HACSessionStatus` | Fetches the request-verification token and database, then signs in. |
| `getUserInfo()` | `HACStudent?` | Name, ID, birthdate, counselor, building, grade, language. |
| `availableMarkingPeriods()` | `(status, current, all, params)` | Lists marking periods (e.g. `"2-2027"`) and returns the form params needed by `requestGrades`. |
| `availableMarkingPeriodsWithCurrentMarkingPeriod(districtWeightIdentifier:)` | `(status, current, all, params, MarkingPeriod?)` | Same as above, plus parses the current period's classes and appends it to `markingPeriods`. |
| `requestGrades(districtWeightIdentifier:forPeriod:dictionary:)` | `HACSessionStatus` | Loads a specific marking period using `params` from either call above and appends it to `markingPeriods`. |
| `getStudentTranscript()` | `(status, [Transcript], [TranscriptGPA])` | Cached after the first successful load. |
| `getStudentSchedule()` | `(status, [Schedule], [String], [String])` | Schedule plus unique marking periods and days. Cached after the first load. |
| `getStudentIPR(requestDate:)` | `(status, [IPR])` | Pass `""` for the latest report, or one of the report's `iprDates` for an older one. |
| `logout()` | — | Signs out of HAC. |
| `clearURLCache()` | — | Clears `URLCache.shared`. |

## Data models

All models are nested in `HACSession` and are `Identifiable`; most are also `Hashable`, `Codable` and `Sendable`.

- **`HACStudent`** — `studentID`, `studentName`, `studentBirthdate`, `studentCounselor`, `studentBuilding`, `studentGrade`, `studentLanguage`.
- **`MarkingPeriod`** — `period` (e.g. `"1-2027"`) and `classes: [Class]`.
- **`Class`** — `name`, `score` (string; `"N/A"` when there is no average), `weight` (GPA weight, see below), `credits` (currently always `0.5`), `assignments`, and `categories`.
  - `categories` is `[categoryName: ["studentPoints", "maximumPoints", "categoryWeight"]]`. If an assignment's category is missing from HAC's category table, a placeholder is inserted with `categoryWeight: "0"` and `"missingCategoryWeight": "YES"`.
- **`Assignment`** — `dateDue`, `dateAssigned`, `name`, `category`, `score` (`"N/A"` if ungraded), `totalPoints`, `weight`, `weightedScore`, `weightedTotalPoints`, `strikeThrough` (dropped/struck-out in HAC), `custom` (for app-side "what-if" assignments; always `false` from HAC). All values are strings as shown in HAC.
- **`Transcript`** — `year`, `building`, `grade`, `columnTitles`, `classes: [TranscriptClass]`, `totalCredits`. Each `TranscriptClass.data` is keyed by the column titles (e.g. `"Course"`, `"Description"`, `"Sem1"`, `"CR"`).
- **`TranscriptGPA`** — `type`, `points`, `rank`.
- **`Schedule`** — `building`, `courseCode`, `courseName`, `days`, `markingPeriods`, `periods`, `room`, `status`, `teacher`.
- **`IPR`** — `title`, `columns`, `rows`, `iprDates`, `comment`.
- **`ReportCard`** — declared for future use; not populated yet.

## District GPA weights

Each `Class.weight` comes from `HACDistrictWeightManager`, keyed by the `districtWeightIdentifier` you pass to the grade methods.

| Identifier | Rules |
| --- | --- |
| `Integrated Frisco ISD` | **6.0** — AP, IB, MATH 2415, MATH 2320, Computer Sci 3 Adv<br>**5.5** — Dual Credit, Adv, PAP, Advanced, Independent Study and Mentorship, Academic Decathlon<br>**5.0** — everything else |
| `Integrated Melissa ISD` | **5.0** — Adv, DC, IB<br>**4.0** — everything else |
| *(any other)* | **5.0** |

Matching is done against the class name as it appears in HAC. New districts are added by implementing `HACDistrictWeights` and registering it in `registerDefaultDistricts()`.

## Demo account

HACSwift includes a built-in account for testing and App Review. When a session uses these credentials, **no network requests are made** — every call returns local mock data after a short simulated delay (0.4 s), and `url`, `districtName` and `hacName` are ignored.

| | |
| --- | --- |
| Username | `hacdemo` (case-insensitive, whitespace trimmed) |
| Password | `hacdemo123` (case-sensitive) |

```swift
// Shortcut that needs no URL or district
let session = HACSession.demo()

// Use in a login screen to skip district selection
if HACDemoAccount.matches(username: enteredUser, password: enteredPassword) {
    session = .demo()
}
```

The mock data covers a student profile, four marking periods (`1-2027` through `4-2027`, with `2-2027` as current and later periods empty), a six-class schedule, two years of transcript with GPA/rank, and two interim progress reports (`10/23/2026`, `09/11/2026`).

## Version

```swift
HACSwiftInformation().version   // "1.0.0"
```
