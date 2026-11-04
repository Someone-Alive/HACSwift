//
//  HACDemoAccount.swift
//  HACSwift
//
//  A built-in testing / App Review account. When an HACSession is created with
//  these credentials, every call is answered locally with mock data — no network
//  requests are made and the url / districtName / hacName values are ignored.
//

import Foundation

public enum HACDemoAccount {
    /// Username for the demo account (matched case-insensitively, whitespace trimmed).
    public static let username = "nowDemo-6f"
    /// Password for the demo account (matched exactly).
    public static let password = "nowdemo123"

    /// Artificial delay so loading states in the UI still look natural (seconds).
    public static let simulatedDelay: Double = 0.4

    /// Returns true when the given credentials belong to the demo account.
    /// Use this in your login screen to skip district selection.
    public static func matches(username: String, password: String) -> Bool {
        username.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == Self.username
            && password == Self.password
    }
}

// MARK: - Mock data

enum HACMockData {

    // MARK: Spec types

    struct CategorySpec: Sendable {
        let name: String
        let weight: Double
        let suffix: String
    }

    struct ClassSpec: Sendable {
        let courseCode: String
        let name: String
        let teacher: String
        let room: String
        let period: String
        let ability: Double          // typical score for this class
        let categories: [CategorySpec] // first category = major grades
        let topics: [[String]]         // topics per marking period (index 0 = MP1, ...)
    }

    struct PeriodSpec: Sendable {
        let value: String   // the HAC option value, e.g. "1-2027"
        let start: String   // MM/dd/yyyy
        let gradedThrough: String?  // last date with graded work (nil = no grades yet)
    }

    // MARK: Static content

    static let markingPeriods: [PeriodSpec] = [
        PeriodSpec(value: "1-2027", start: "08/13/2026", gradedThrough: "10/08/2026"),
        PeriodSpec(value: "2-2027", start: "10/13/2026", gradedThrough: "11/02/2026"),
        PeriodSpec(value: "3-2027", start: "01/06/2027", gradedThrough: nil),
        PeriodSpec(value: "4-2027", start: "03/22/2027", gradedThrough: nil)
    ]

    static let currentMarkingPeriod = "2-2027"

    static let classes: [ClassSpec] = [
        ClassSpec(
            courseCode: "MTH4602A", name: "AP Calculus BC", teacher: "Patel, Anika", room: "B214", period: "1",
            ability: 91,
            categories: [
                CategorySpec(name: "Major", weight: 60, suffix: "Test"),
                CategorySpec(name: "Minor", weight: 40, suffix: "Quiz")
            ],
            topics: [
                ["Limits", "Continuity", "Derivative Rules", "Chain Rule", "Implicit Differentiation"],
                ["Related Rates", "Linear Approximation", "Optimization", "Curve Sketching"]
            ]
        ),
        ClassSpec(
            courseCode: "ENG3300A", name: "English 3 Adv", teacher: "Thompson, Mark", room: "A118", period: "2",
            ability: 94,
            categories: [
                CategorySpec(name: "Major", weight: 50, suffix: "Essay"),
                CategorySpec(name: "Daily", weight: 30, suffix: "Response"),
                CategorySpec(name: "Reading", weight: 20, suffix: "Reading Check")
            ],
            topics: [
                ["The Crucible", "Puritan Sermons", "Rhetorical Analysis", "Transcendentalism"],
                ["The Great Gatsby", "Modernist Poetry", "Argument Writing"]
            ]
        ),
        ClassSpec(
            courseCode: "SOC3500A", name: "AP US History", teacher: "Garcia, Elena", room: "C205", period: "3",
            ability: 88,
            categories: [
                CategorySpec(name: "Major", weight: 60, suffix: "Exam"),
                CategorySpec(name: "Minor", weight: 40, suffix: "DBQ Practice")
            ],
            topics: [
                ["Period 1", "Period 2", "Period 3", "Period 4"],
                ["Period 5", "Reconstruction", "Gilded Age"]
            ]
        ),
        ClassSpec(
            courseCode: "SCI3200A", name: "Chemistry Adv", teacher: "Nguyen, David", room: "S102", period: "4",
            ability: 92,
            categories: [
                CategorySpec(name: "Major", weight: 50, suffix: "Test"),
                CategorySpec(name: "Lab", weight: 25, suffix: "Lab Report"),
                CategorySpec(name: "Daily", weight: 25, suffix: "Worksheet")
            ],
            topics: [
                ["Measurement", "Atomic Structure", "Periodic Trends", "Bonding"],
                ["Nomenclature", "The Mole", "Stoichiometry"]
            ]
        ),
        ClassSpec(
            courseCode: "CTE4100A", name: "AP Computer Science A", teacher: "Chen, Kevin", room: "T110", period: "5",
            ability: 97,
            categories: [
                CategorySpec(name: "Major", weight: 50, suffix: "Test"),
                CategorySpec(name: "Minor", weight: 30, suffix: "Quiz"),
                CategorySpec(name: "Projects", weight: 20, suffix: "Lab")
            ],
            topics: [
                ["Primitive Types", "Using Objects", "Boolean Logic", "Iteration"],
                ["Writing Classes", "Arrays", "ArrayList"]
            ]
        ),
        ClassSpec(
            courseCode: "LOT3300", name: "Spanish 3", teacher: "Morales, Lucia", room: "A204", period: "6",
            ability: 93,
            categories: [
                CategorySpec(name: "Major", weight: 50, suffix: "Assessment"),
                CategorySpec(name: "Minor", weight: 50, suffix: "Quiz")
            ],
            topics: [
                ["Preterite", "Imperfect", "Travel Vocabulary", "Commands"],
                ["Subjunctive", "Health Vocabulary", "Future Tense"]
            ]
        ),
        ClassSpec(
            courseCode: "FAM3700", name: "Orchestra 3", teacher: "Wallace, James", room: "F001", period: "7",
            ability: 99,
            categories: [
                CategorySpec(name: "Performance", weight: 60, suffix: "Performance"),
                CategorySpec(name: "Daily", weight: 40, suffix: "Practice Log")
            ],
            topics: [
                ["Scales", "Sight Reading", "Fall Concert Prep"],
                ["Fall Concert", "UIL Etudes", "Winter Concert Prep"]
            ]
        )
    ]

    // MARK: Student

    static func student() -> HACSession.HACStudent {
        HACSession.HACStudent(
            studentID: "respect-my-authoritah",
            studentName: "Eric Cartman",
            studentBirthdate: "07/01/1997",
            studentCounselor: "Mr Mackey",
            studentBuilding: "South Park Elementary",
            studentGrade: "4",
            studentLanguage: "English"
        )
    }

    // MARK: Grades

    static var markingPeriodValues: [String] { markingPeriods.map(\.value) }

    static func markingPeriod(_ value: String) -> HACSession.MarkingPeriod? {
        guard let periodIndex = markingPeriods.firstIndex(where: { $0.value == value }) else { return nil }
        let period = markingPeriods[periodIndex]

        let builtClasses = classes.map { spec -> HACSession.Class in
            buildClass(spec, periodIndex: periodIndex, period: period)
        }
        return HACSession.MarkingPeriod(period: value, classes: builtClasses)
    }

    private static func buildClass(_ spec: ClassSpec, periodIndex: Int, period: PeriodSpec) -> HACSession.Class {
        let weight = demoWeight(for: spec.name)
        let topics = periodIndex < spec.topics.count ? spec.topics[periodIndex] : []

        guard let gradedThrough = period.gradedThrough, !topics.isEmpty,
              let start = date(period.start), let end = date(gradedThrough) else {
            // Future marking period: no assignments yet, like HAC shows it.
            return HACSession.Class(name: spec.name, score: "N/A", weight: weight, credits: 0.5, assignments: [], categories: [:])
        }

        var rng = SeededGenerator(seed: "\(spec.courseCode)-\(period.value)")
        let major = spec.categories[0]
        let minors = Array(spec.categories.dropFirst())

        // Build the list of (name, category) in chronological order.
        var plan: [(String, CategorySpec)] = []
        for (i, topic) in topics.enumerated() {
            for minor in (minors.isEmpty ? [major] : minors) {
                plan.append(("\(topic) \(minor.suffix)", minor))
            }
            if !minors.isEmpty && (i % 2 == 1 || i == topics.count - 1) {
                plan.append(("\(topic) \(major.suffix)", major))
            }
        }

        let totalDays = max(1, Calendar.mockCalendar.dateComponents([.day], from: start, to: end).day ?? 1)
        var assignments: [HACSession.Assignment] = []

        for (i, item) in plan.enumerated() {
            let dayOffset = Int(Double(totalDays) * Double(i + 1) / Double(plan.count))
            let due = Calendar.mockCalendar.date(byAdding: .day, value: dayOffset, to: start) ?? end
            let assigned = Calendar.mockCalendar.date(byAdding: .day, value: -(item.1.name == major.name ? 7 : 2), to: due) ?? due

            let total: Double = item.1.name == major.name ? 100 : (rng.next() < 0.5 ? 100 : 50)
            let variance = (rng.next() - 0.5) * 16
            let pct = min(100, max(60, spec.ability + variance)) / 100
            let score = (total * pct).rounded()

            assignments.append(HACSession.Assignment(
                dateDue: format(due),
                dateAssigned: format(assigned),
                name: item.0,
                category: item.1.name,
                score: fmt(score),
                totalPoints: fmt(total),
                weight: "1.00",
                weightedScore: fmt(score),
                weightedTotalPoints: fmt(total),
                strikeThrough: false,
                custom: false
            ))
        }

        // A dropped assignment (shown with strikethrough) in the first class of each graded period.
        if spec.period == "1", let first = assignments.first {
            assignments.insert(HACSession.Assignment(
                dateDue: first.dateDue, dateAssigned: first.dateAssigned,
                name: "\(topics[0]) Retake Quiz", category: minors.first?.name ?? major.name,
                score: "62.00", totalPoints: "100.00", weight: "1.00",
                weightedScore: "62.00", weightedTotalPoints: "100.00",
                strikeThrough: true, custom: false
            ), at: 1)
        }

        // An upcoming, not-yet-graded assignment in the current marking period.
        if period.value == currentMarkingPeriod, let upcoming = Calendar.mockCalendar.date(byAdding: .day, value: 4, to: end) {
            assignments.append(HACSession.Assignment(
                dateDue: format(upcoming),
                dateAssigned: format(end),
                name: "\(topics.last ?? "Unit") \(major.suffix)",
                category: major.name,
                score: "N/A",
                totalPoints: "100.00",
                weight: "1.00",
                weightedScore: "",
                weightedTotalPoints: "100.00",
                strikeThrough: false,
                custom: false
            ))
        }

        // Category totals + overall average, computed the same way HAC does.
        var categoryWeights: [String: [String: String]] = [:]
        var weightedSum = 0.0
        var weightUsed = 0.0

        for category in spec.categories {
            let graded = assignments.filter {
                $0.category == category.name && !$0.strikeThrough && Double($0.score) != nil
            }
            let earned = graded.reduce(0.0) { $0 + (Double($1.score) ?? 0) }
            let possible = graded.reduce(0.0) { $0 + (Double($1.totalPoints) ?? 0) }

            categoryWeights[category.name] = [
                "studentPoints": fmt(earned),
                "maximumPoints": fmt(possible),
                "categoryWeight": fmt(category.weight)
            ]

            if possible > 0 {
                weightedSum += (earned / possible) * category.weight
                weightUsed += category.weight
            }
        }

        let average = weightUsed > 0 ? (weightedSum / weightUsed) * 100 : 0

        return HACSession.Class(
            name: spec.name,
            score: weightUsed > 0 ? fmt(average) : "N/A",
            weight: weight,
            credits: 0.5,
            assignments: assignments,
            categories: categoryWeights
        )
    }

    /// District-independent course weighting for the demo (AP = 6.0, Adv = 5.5, else 5.0).
    static func demoWeight(for className: String) -> Double {
        if className.range(of: "\\bAP\\b", options: .regularExpression) != nil { return 6.0 }
        if className.range(of: "\\bAdv\\b", options: .regularExpression) != nil { return 5.5 }
        return 5.0
    }

    // MARK: Schedule

    static func schedule() -> [HACSession.Schedule] {
        classes.map {
            HACSession.Schedule(
                building: "Demo High School",
                courseCode: "\($0.courseCode) - 1",
                courseName: $0.name,
                days: "M T W R F",
                markingPeriods: "Q1, Q2, Q3, Q4",
                periods: $0.period,
                room: $0.room,
                status: "Active",
                teacher: $0.teacher
            )
        }
    }

    // MARK: Transcript

    static func transcript() -> ([HACSession.Transcript], [HACSession.TranscriptGPA]) {
        let columns = ["Course", "Description", "Sem1", "Sem2", "CR"]

        func row(_ code: String, _ name: String, _ s1: String, _ s2: String, _ cr: String = "1.0000") -> HACSession.TranscriptClass {
            HACSession.TranscriptClass(data: ["Course": code, "Description": name, "Sem1": s1, "Sem2": s2, "CR": cr])
        }

        let grade9 = HACSession.Transcript(
            year: "2024-2025",
            building: "Demo High School",
            grade: "09",
            columnTitles: columns,
            classes: [
                row("ENG1300A", "English 1 Adv", "95", "96"),
                row("MTH2300A", "Geometry Adv", "93", "91"),
                row("SCI1300A", "Biology Adv", "94", "95"),
                row("SOC1500A", "AP Human Geography", "90", "92"),
                row("LOT1300", "Spanish 1", "97", "98"),
                row("FAM1700", "Orchestra 1", "100", "100"),
                row("PED1100", "Physical Education", "100", "100", "0.5000")
            ],
            totalCredits: "6.5000"
        )

        let grade10 = HACSession.Transcript(
            year: "2025-2026",
            building: "Demo High School",
            grade: "10",
            columnTitles: columns,
            classes: [
                row("ENG2300A", "English 2 Adv", "94", "95"),
                row("MTH3300A", "Algebra 2 Adv", "92", "94"),
                row("SCI2300A", "Physics 1 Adv", "91", "93"),
                row("SOC2500A", "AP World History", "89", "91"),
                row("LOT2300", "Spanish 2", "96", "95"),
                row("FAM2700", "Orchestra 2", "100", "100"),
                row("CTE2100", "Computer Science 1", "99", "100")
            ],
            totalCredits: "7.0000"
        )

        let gpa = [
            HACSession.TranscriptGPA(type: "Weighted GPA", points: "5.3214", rank: "48 / 912"),
            HACSession.TranscriptGPA(type: "Unweighted GPA", points: "3.9600", rank: "")
        ]

        return ([grade9, grade10], gpa)
    }

    // MARK: IPR

    static let iprDates = ["10/23/2026", "09/11/2026"]

    static func ipr(requestDate: String) -> [HACSession.IPR] {
        let date = iprDates.contains(requestDate) ? requestDate : iprDates[0]
        let offset: Double = date == iprDates[0] ? 0 : -1.5

        let rows: [[String]] = classes.map { spec in
            var rng = SeededGenerator(seed: "ipr-\(spec.courseCode)-\(date)")
            let score = min(100, max(70, spec.ability + offset + (rng.next() - 0.5) * 4))
            return ["\(spec.courseCode) - 1", spec.name, spec.period, spec.teacher, spec.room, String(Int(score.rounded()))]
        }

        return [
            HACSession.IPR(
                title: "Interim Progress Report For \(date)",
                columns: ["Course", "Description", "Period", "Teacher", "Room", "Score"],
                rows: rows,
                iprDates: iprDates,
                comment: "No comments are available for this report."
            )
        ]
    }

    // MARK: Helpers

    private static func fmt(_ value: Double) -> String {
        String(format: "%.2f", value)
    }

    private static func makeFormatter() -> DateFormatter {
        let f = DateFormatter()
        f.calendar = Calendar.mockCalendar
        f.locale = Locale(identifier: "en_US_POSIX")
        f.timeZone = TimeZone(identifier: "UTC")
        f.dateFormat = "MM/dd/yyyy"
        return f
    }

    private static func date(_ string: String) -> Date? {
        makeFormatter().date(from: string)
    }

    private static func format(_ date: Date) -> String {
        makeFormatter().string(from: date)
    }

    /// Small deterministic RNG so the demo shows the same data on every launch.
    struct SeededGenerator {
        private var state: UInt64

        init(seed: String) {
            var hash: UInt64 = 5381
            for byte in seed.utf8 { hash = (hash &* 33) &+ UInt64(byte) }
            state = hash == 0 ? 0x9E3779B97F4A7C15 : hash
        }

        /// Returns a value in [0, 1).
        mutating func next() -> Double {
            state = state &* 6364136223846793005 &+ 1442695040888963407
            return Double(state >> 11) / Double(1 << 53)
        }
    }
}

private extension Calendar {
    static var mockCalendar: Calendar {
        var c = Calendar(identifier: .gregorian)
        c.timeZone = TimeZone(identifier: "UTC") ?? .current
        return c
    }
}
