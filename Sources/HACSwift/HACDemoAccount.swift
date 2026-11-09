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
    public static let username = "HACdemo"
    /// Password for the demo account (matched exactly).
    public static let password = "HACdemo123"
 
    /// Artificial delay so loading states in the UI still look natural (seconds).
    public static let simulatedDelay: Double = 0.4
 
    /// Returns true when the given credentials belong to the demo account.
    /// Use this in your login screen to skip district selection.
    public static func matches(username: String, password: String) -> Bool {
        return username.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == Self.username
            && password == Self.password
    }
}
 
// MARK: - Mock data
 
enum HACMockData {
 
    // MARK: Student
 
    static let student = HACSession.HACStudent(
        studentID: "respect-my-authoritah",
        studentName: "Eric Cartman",
        studentBirthdate: "07/01/1997",
        studentCounselor: "Mr Mackey",
        studentBuilding: "South Park Elementary",
        studentGrade: "4",
        studentLanguage: "English"
    )
 
    // MARK: Marking Periods
 
    static let currentMarkingPeriod = "2-2027"
    static let markingPeriodValues = ["1-2027", "2-2027", "3-2027", "4-2027"]
 
    static let markingPeriods: [String: HACSession.MarkingPeriod] = [
        "1-2027": HACSession.MarkingPeriod(period: "1-2027", classes: [
            HACSession.Class(
                name: "AP Calculus BC",
                score: "89.12",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/22/2026", dateAssigned: "08/18/2026", name: "Limits Quiz", category: "Minor", score: "92.00", totalPoints: "100.00", weight: "1.00", weightedScore: "92.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "08/29/2026", dateAssigned: "08/25/2026", name: "Limits Retake Quiz", category: "Minor", score: "62.00", totalPoints: "100.00", weight: "1.00", weightedScore: "62.00", weightedTotalPoints: "100.00", strikeThrough: true, custom: false),
                    HACSession.Assignment(dateDue: "09/05/2026", dateAssigned: "09/01/2026", name: "Continuity Quiz", category: "Minor", score: "88.00", totalPoints: "100.00", weight: "1.00", weightedScore: "88.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/12/2026", dateAssigned: "09/05/2026", name: "Unit 1 Test", category: "Major", score: "90.00", totalPoints: "100.00", weight: "1.00", weightedScore: "90.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/26/2026", dateAssigned: "09/22/2026", name: "Chain Rule Quiz", category: "Minor", score: "47.00", totalPoints: "50.00", weight: "1.00", weightedScore: "47.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/08/2026", dateAssigned: "10/01/2026", name: "Unit 2 Test", category: "Major", score: "86.00", totalPoints: "100.00", weight: "1.00", weightedScore: "86.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "176.00", "maximumPoints": "200.00", "categoryWeight": "60.00"],
                    "Minor": ["studentPoints": "227.00", "maximumPoints": "250.00", "categoryWeight": "40.00"]
                ]
            ),
            HACSession.Class(
                name: "English 3 Adv",
                score: "95.85",
                weight: 5.5,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/21/2026", dateAssigned: "08/17/2026", name: "The Crucible Reading Check", category: "Reading", score: "100.00", totalPoints: "100.00", weight: "1.00", weightedScore: "100.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "08/28/2026", dateAssigned: "08/24/2026", name: "Puritan Sermons Response", category: "Daily", score: "95.00", totalPoints: "100.00", weight: "1.00", weightedScore: "95.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/11/2026", dateAssigned: "09/02/2026", name: "Rhetorical Analysis Essay", category: "Major", score: "93.00", totalPoints: "100.00", weight: "1.00", weightedScore: "93.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/25/2026", dateAssigned: "09/21/2026", name: "Transcendentalism Response", category: "Daily", score: "48.00", totalPoints: "50.00", weight: "1.00", weightedScore: "48.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/06/2026", dateAssigned: "09/28/2026", name: "Argument Essay", category: "Major", score: "96.00", totalPoints: "100.00", weight: "1.00", weightedScore: "96.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "189.00", "maximumPoints": "200.00", "categoryWeight": "50.00"],
                    "Daily": ["studentPoints": "143.00", "maximumPoints": "150.00", "categoryWeight": "30.00"],
                    "Reading": ["studentPoints": "100.00", "maximumPoints": "100.00", "categoryWeight": "20.00"]
                ]
            ),
            HACSession.Class(
                name: "AP US History",
                score: "86.60",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/26/2026", dateAssigned: "08/20/2026", name: "Period 1 DBQ Practice", category: "Minor", score: "85.00", totalPoints: "100.00", weight: "1.00", weightedScore: "85.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/09/2026", dateAssigned: "09/01/2026", name: "Periods 1-2 Exam", category: "Major", score: "84.00", totalPoints: "100.00", weight: "1.00", weightedScore: "84.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/23/2026", dateAssigned: "09/17/2026", name: "Period 3 DBQ Practice", category: "Minor", score: "90.00", totalPoints: "100.00", weight: "1.00", weightedScore: "90.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/07/2026", dateAssigned: "09/29/2026", name: "Periods 3-4 Exam", category: "Major", score: "88.00", totalPoints: "100.00", weight: "1.00", weightedScore: "88.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "172.00", "maximumPoints": "200.00", "categoryWeight": "60.00"],
                    "Minor": ["studentPoints": "175.00", "maximumPoints": "200.00", "categoryWeight": "40.00"]
                ]
            ),
            HACSession.Class(
                name: "Chemistry Adv",
                score: "92.83",
                weight: 5.5,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/24/2026", dateAssigned: "08/19/2026", name: "Measurement Worksheet", category: "Daily", score: "100.00", totalPoints: "100.00", weight: "1.00", weightedScore: "100.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/03/2026", dateAssigned: "08/27/2026", name: "Density Lab Report", category: "Lab", score: "94.00", totalPoints: "100.00", weight: "1.00", weightedScore: "94.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/15/2026", dateAssigned: "09/08/2026", name: "Atomic Structure Test", category: "Major", score: "89.00", totalPoints: "100.00", weight: "1.00", weightedScore: "89.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/30/2026", dateAssigned: "09/24/2026", name: "Periodic Trends Worksheet", category: "Daily", score: "46.00", totalPoints: "50.00", weight: "1.00", weightedScore: "46.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/08/2026", dateAssigned: "10/01/2026", name: "Bonding Test", category: "Major", score: "91.00", totalPoints: "100.00", weight: "1.00", weightedScore: "91.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "180.00", "maximumPoints": "200.00", "categoryWeight": "50.00"],
                    "Lab": ["studentPoints": "94.00", "maximumPoints": "100.00", "categoryWeight": "25.00"],
                    "Daily": ["studentPoints": "146.00", "maximumPoints": "150.00", "categoryWeight": "25.00"]
                ]
            ),
            HACSession.Class(
                name: "AP Computer Science A",
                score: "97.60",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/25/2026", dateAssigned: "08/19/2026", name: "Primitive Types Quiz", category: "Minor", score: "100.00", totalPoints: "100.00", weight: "1.00", weightedScore: "100.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/04/2026", dateAssigned: "08/27/2026", name: "Using Objects Lab", category: "Projects", score: "100.00", totalPoints: "100.00", weight: "1.00", weightedScore: "100.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/18/2026", dateAssigned: "09/11/2026", name: "Unit 1-2 Test", category: "Major", score: "97.00", totalPoints: "100.00", weight: "1.00", weightedScore: "97.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/02/2026", dateAssigned: "09/25/2026", name: "Iteration Quiz", category: "Minor", score: "48.00", totalPoints: "50.00", weight: "1.00", weightedScore: "48.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/08/2026", dateAssigned: "10/01/2026", name: "Unit 3-4 Test", category: "Major", score: "95.00", totalPoints: "100.00", weight: "1.00", weightedScore: "95.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "192.00", "maximumPoints": "200.00", "categoryWeight": "50.00"],
                    "Minor": ["studentPoints": "148.00", "maximumPoints": "150.00", "categoryWeight": "30.00"],
                    "Projects": ["studentPoints": "100.00", "maximumPoints": "100.00", "categoryWeight": "20.00"]
                ]
            ),
            HACSession.Class(
                name: "Spanish 3",
                score: "93.00",
                weight: 5.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "08/27/2026", dateAssigned: "08/21/2026", name: "Preterite Quiz", category: "Minor", score: "92.00", totalPoints: "100.00", weight: "1.00", weightedScore: "92.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/10/2026", dateAssigned: "09/01/2026", name: "Preterite vs Imperfect Assessment", category: "Major", score: "90.00", totalPoints: "100.00", weight: "1.00", weightedScore: "90.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "09/24/2026", dateAssigned: "09/18/2026", name: "Travel Vocabulary Quiz", category: "Minor", score: "96.00", totalPoints: "100.00", weight: "1.00", weightedScore: "96.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/06/2026", dateAssigned: "09/29/2026", name: "Commands Assessment", category: "Major", score: "94.00", totalPoints: "100.00", weight: "1.00", weightedScore: "94.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "184.00", "maximumPoints": "200.00", "categoryWeight": "50.00"],
                    "Minor": ["studentPoints": "188.00", "maximumPoints": "200.00", "categoryWeight": "50.00"]
                ]
            )
        ]),
        "2-2027": HACSession.MarkingPeriod(period: "2-2027", classes: [
            HACSession.Class(
                name: "AP Calculus BC",
                score: "90.47",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/17/2026", dateAssigned: "10/13/2026", name: "Related Rates Quiz", category: "Minor", score: "94.00", totalPoints: "100.00", weight: "1.00", weightedScore: "94.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/24/2026", dateAssigned: "10/20/2026", name: "Linear Approximation Quiz", category: "Minor", score: "45.00", totalPoints: "50.00", weight: "1.00", weightedScore: "45.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/31/2026", dateAssigned: "10/24/2026", name: "Unit 3 Test", category: "Major", score: "89.00", totalPoints: "100.00", weight: "1.00", weightedScore: "89.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/07/2026", dateAssigned: "11/02/2026", name: "Optimization Test", category: "Major", score: "N/A", totalPoints: "100.00", weight: "1.00", weightedScore: "", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "89.00", "maximumPoints": "100.00", "categoryWeight": "60.00"],
                    "Minor": ["studentPoints": "139.00", "maximumPoints": "150.00", "categoryWeight": "40.00"]
                ]
            ),
            HACSession.Class(
                name: "English 3 Adv",
                score: "94.10",
                weight: 5.5,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/16/2026", dateAssigned: "10/13/2026", name: "The Great Gatsby Reading Check", category: "Reading", score: "90.00", totalPoints: "100.00", weight: "1.00", weightedScore: "90.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/23/2026", dateAssigned: "10/19/2026", name: "Modernist Poetry Response", category: "Daily", score: "97.00", totalPoints: "100.00", weight: "1.00", weightedScore: "97.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/30/2026", dateAssigned: "10/20/2026", name: "Gatsby Literary Analysis Essay", category: "Major", score: "94.00", totalPoints: "100.00", weight: "1.00", weightedScore: "94.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/09/2026", dateAssigned: "11/02/2026", name: "Research Proposal", category: "Major", score: "N/A", totalPoints: "100.00", weight: "1.00", weightedScore: "", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "94.00", "maximumPoints": "100.00", "categoryWeight": "50.00"],
                    "Daily": ["studentPoints": "97.00", "maximumPoints": "100.00", "categoryWeight": "30.00"],
                    "Reading": ["studentPoints": "90.00", "maximumPoints": "100.00", "categoryWeight": "20.00"]
                ]
            ),
            HACSession.Class(
                name: "AP US History",
                score: "90.00",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/21/2026", dateAssigned: "10/15/2026", name: "Period 5 DBQ Practice", category: "Minor", score: "92.00", totalPoints: "100.00", weight: "1.00", weightedScore: "92.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/28/2026", dateAssigned: "10/22/2026", name: "Reconstruction LEQ", category: "Minor", score: "43.00", totalPoints: "50.00", weight: "1.00", weightedScore: "43.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/06/2026", dateAssigned: "10/29/2026", name: "Periods 5-6 Exam", category: "Major", score: "N/A", totalPoints: "100.00", weight: "1.00", weightedScore: "", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "0.00", "maximumPoints": "0.00", "categoryWeight": "60.00"],
                    "Minor": ["studentPoints": "135.00", "maximumPoints": "150.00", "categoryWeight": "40.00"]
                ]
            ),
            HACSession.Class(
                name: "Chemistry Adv",
                score: "90.25",
                weight: 5.5,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/19/2026", dateAssigned: "10/14/2026", name: "Nomenclature Worksheet", category: "Daily", score: "95.00", totalPoints: "100.00", weight: "1.00", weightedScore: "95.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/27/2026", dateAssigned: "10/21/2026", name: "Mole Lab Report", category: "Lab", score: "92.00", totalPoints: "100.00", weight: "1.00", weightedScore: "92.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/02/2026", dateAssigned: "10/26/2026", name: "The Mole Test", category: "Major", score: "87.00", totalPoints: "100.00", weight: "1.00", weightedScore: "87.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "87.00", "maximumPoints": "100.00", "categoryWeight": "50.00"],
                    "Lab": ["studentPoints": "92.00", "maximumPoints": "100.00", "categoryWeight": "25.00"],
                    "Daily": ["studentPoints": "95.00", "maximumPoints": "100.00", "categoryWeight": "25.00"]
                ]
            ),
            HACSession.Class(
                name: "AP Computer Science A",
                score: "98.80",
                weight: 6.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/20/2026", dateAssigned: "10/14/2026", name: "Writing Classes Quiz", category: "Minor", score: "98.00", totalPoints: "100.00", weight: "1.00", weightedScore: "98.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/30/2026", dateAssigned: "10/21/2026", name: "Bank Account Project", category: "Projects", score: "100.00", totalPoints: "100.00", weight: "1.00", weightedScore: "100.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/10/2026", dateAssigned: "11/03/2026", name: "Arrays Test", category: "Major", score: "N/A", totalPoints: "100.00", weight: "1.00", weightedScore: "", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "0.00", "maximumPoints": "0.00", "categoryWeight": "50.00"],
                    "Minor": ["studentPoints": "98.00", "maximumPoints": "100.00", "categoryWeight": "30.00"],
                    "Projects": ["studentPoints": "100.00", "maximumPoints": "100.00", "categoryWeight": "20.00"]
                ]
            ),
            HACSession.Class(
                name: "Spanish 3",
                score: "90.00",
                weight: 5.0,
                credits: 0.5,
                assignments: [
                    HACSession.Assignment(dateDue: "10/22/2026", dateAssigned: "10/16/2026", name: "Subjunctive Quiz", category: "Minor", score: "88.00", totalPoints: "100.00", weight: "1.00", weightedScore: "88.00", weightedTotalPoints: "100.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "10/29/2026", dateAssigned: "10/23/2026", name: "Health Vocabulary Quiz", category: "Minor", score: "47.00", totalPoints: "50.00", weight: "1.00", weightedScore: "47.00", weightedTotalPoints: "50.00", strikeThrough: false, custom: false),
                    HACSession.Assignment(dateDue: "11/05/2026", dateAssigned: "10/30/2026", name: "Subjunctive Assessment", category: "Major", score: "N/A", totalPoints: "100.00", weight: "1.00", weightedScore: "", weightedTotalPoints: "100.00", strikeThrough: false, custom: false)
                ],
                categories: [
                    "Major": ["studentPoints": "0.00", "maximumPoints": "0.00", "categoryWeight": "50.00"],
                    "Minor": ["studentPoints": "135.00", "maximumPoints": "150.00", "categoryWeight": "50.00"]
                ]
            )
        ]),
        "3-2027": HACSession.MarkingPeriod(period: "3-2027", classes: [
            HACSession.Class(name: "AP Calculus BC", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "English 3 Adv", score: "N/A", weight: 5.5, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "AP US History", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "Chemistry Adv", score: "N/A", weight: 5.5, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "AP Computer Science A", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "Spanish 3", score: "N/A", weight: 5.0, credits: 0.5, assignments: [], categories: [:])
        ]),
        "4-2027": HACSession.MarkingPeriod(period: "4-2027", classes: [
            HACSession.Class(name: "AP Calculus BC", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "English 3 Adv", score: "N/A", weight: 5.5, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "AP US History", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "Chemistry Adv", score: "N/A", weight: 5.5, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "AP Computer Science A", score: "N/A", weight: 6.0, credits: 0.5, assignments: [], categories: [:]),
            HACSession.Class(name: "Spanish 3", score: "N/A", weight: 5.0, credits: 0.5, assignments: [], categories: [:])
        ])
    ]
 
    // MARK: Schedule
 
    static let schedule: [HACSession.Schedule] = [
        HACSession.Schedule(building: "Demo High School", courseCode: "MTH4602A - 1", courseName: "AP Calculus BC", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "1", room: "B214", status: "Active", teacher: "Patel, Anika"),
        HACSession.Schedule(building: "Demo High School", courseCode: "ENG3300A - 1", courseName: "English 3 Adv", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "2", room: "A118", status: "Active", teacher: "Thompson, Mark"),
        HACSession.Schedule(building: "Demo High School", courseCode: "SOC3500A - 1", courseName: "AP US History", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "3", room: "C205", status: "Active", teacher: "Garcia, Elena"),
        HACSession.Schedule(building: "Demo High School", courseCode: "SCI3200A - 1", courseName: "Chemistry Adv", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "4", room: "S102", status: "Active", teacher: "Nguyen, David"),
        HACSession.Schedule(building: "Demo High School", courseCode: "CTE4100A - 1", courseName: "AP Computer Science A", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "5", room: "T110", status: "Active", teacher: "Chen, Kevin"),
        HACSession.Schedule(building: "Demo High School", courseCode: "LOT3300 - 1", courseName: "Spanish 3", days: "M T W R F", markingPeriods: "Q1, Q2, Q3, Q4", periods: "6", room: "A204", status: "Active", teacher: "Morales, Lucia")
    ]
 
    // MARK: Transcript
 
    static let transcript: [HACSession.Transcript] = [
        HACSession.Transcript(
            year: "2024-2025",
            building: "Demo High School",
            grade: "09",
            columnTitles: ["Course", "Description", "Sem1", "Sem2", "CR"],
            classes: [
                HACSession.TranscriptClass(data: ["Course": "ENG1300A", "Description": "English 1 Adv", "Sem1": "95", "Sem2": "96", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "MTH2300A", "Description": "Geometry Adv", "Sem1": "93", "Sem2": "91", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "SCI1300A", "Description": "Biology Adv", "Sem1": "94", "Sem2": "95", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "SOC1500A", "Description": "AP Human Geography", "Sem1": "90", "Sem2": "92", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "LOT1300", "Description": "Spanish 1", "Sem1": "97", "Sem2": "98", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "PED1100", "Description": "Physical Education", "Sem1": "100", "Sem2": "100", "CR": "0.5000"])
            ],
            totalCredits: "5.5000"
        ),
        HACSession.Transcript(
            year: "2025-2026",
            building: "Demo High School",
            grade: "10",
            columnTitles: ["Course", "Description", "Sem1", "Sem2", "CR"],
            classes: [
                HACSession.TranscriptClass(data: ["Course": "ENG2300A", "Description": "English 2 Adv", "Sem1": "94", "Sem2": "95", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "MTH3300A", "Description": "Algebra 2 Adv", "Sem1": "92", "Sem2": "94", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "SCI2300A", "Description": "Physics 1 Adv", "Sem1": "91", "Sem2": "93", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "SOC2500A", "Description": "AP World History", "Sem1": "89", "Sem2": "91", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "LOT2300", "Description": "Spanish 2", "Sem1": "96", "Sem2": "95", "CR": "1.0000"]),
                HACSession.TranscriptClass(data: ["Course": "CTE2100", "Description": "Computer Science 1", "Sem1": "99", "Sem2": "100", "CR": "1.0000"])
            ],
            totalCredits: "6.0000"
        )
    ]
 
    static let transcriptGPA: [HACSession.TranscriptGPA] = [
        HACSession.TranscriptGPA(type: "Weighted GPA", points: "5.3214", rank: "48 / 912"),
        HACSession.TranscriptGPA(type: "Unweighted GPA", points: "3.9600", rank: "")
    ]
 
    // MARK: IPR
 
    static let iprDates = ["10/23/2026", "09/11/2026"]
 
    static func ipr(requestDate: String) -> [HACSession.IPR] {
        let columns = ["Course", "Description", "Period", "Teacher", "Room", "Score"]
 
        if requestDate == "09/11/2026" {
            return [HACSession.IPR(
                title: "Interim Progress Report For 09/11/2026",
                columns: columns,
                rows: [
                    ["MTH4602A - 1", "AP Calculus BC", "1", "Patel, Anika", "B214", "90"],
                    ["ENG3300A - 1", "English 3 Adv", "2", "Thompson, Mark", "A118", "96"],
                    ["SOC3500A - 1", "AP US History", "3", "Garcia, Elena", "C205", "85"],
                    ["SCI3200A - 1", "Chemistry Adv", "4", "Nguyen, David", "S102", "94"],
                    ["CTE4100A - 1", "AP Computer Science A", "5", "Chen, Kevin", "T110", "100"],
                    ["LOT3300 - 1", "Spanish 3", "6", "Morales, Lucia", "A204", "91"]
                ],
                iprDates: iprDates,
                comment: "No comments are available for this report."
            )]
        }
 
        return [HACSession.IPR(
            title: "Interim Progress Report For 10/23/2026",
            columns: columns,
            rows: [
                ["MTH4602A - 1", "AP Calculus BC", "1", "Patel, Anika", "B214", "92"],
                ["ENG3300A - 1", "English 3 Adv", "2", "Thompson, Mark", "A118", "95"],
                ["SOC3500A - 1", "AP US History", "3", "Garcia, Elena", "C205", "90"],
                ["SCI3200A - 1", "Chemistry Adv", "4", "Nguyen, David", "S102", "94"],
                ["CTE4100A - 1", "AP Computer Science A", "5", "Chen, Kevin", "T110", "99"],
                ["LOT3300 - 1", "Spanish 3", "6", "Morales, Lucia", "A204", "92"]
            ],
            iprDates: iprDates,
            comment: "No comments are available for this report."
        )]
    }
}
 
