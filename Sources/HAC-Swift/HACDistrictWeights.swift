//
//  DistrictWeights.swift
//  HAC-Swift
//
//  Created by Noah Kim on 6/12/25.
//

protocol HACDistrictWeights {
    func weight(for className: String) -> Double
}

actor HACDistrictWeightManager {
    static let shared = HACDistrictWeightManager()

    private var calculators: [String: HACDistrictWeights] = [:]

    private init() { }

    func register(district: String, calculator: HACDistrictWeights) {
        calculators[district] = calculator
    }

    func weight(for district: String, className: String) -> Double {
        if let calculator = calculators[district] {
            return calculator.weight(for: className)
        } else {
            print("\(className) is 5.0 (default)")
            return 5.0
        }
    }

    func registerDefaultDistricts() {
        register(district: "Integrated Frisco ISD", calculator: FriscoISDWeights())
        register(district: "Integrated Melissa ISD", calculator: MelissaISDWeights())
    }
    
    private struct FriscoISDWeights: HACDistrictWeights {
        func weight(for className: String) -> Double {
            if className.range(of: "\\bAP\\b", options: .regularExpression) != nil || className.range(of:"IB ") != nil || className.range(of:"MATH 2415") != nil || className.range(of:"MATH 2320") != nil || className.range(of:"Computer Sci 3 Adv") != nil{
                print("\(className) is 6.0")
                return 6.0
                
            }
            else if className.range(of: "Dual Credit") != nil || className.range(of: "\\bAdv\\b", options: .regularExpression) != nil || className.range(of: "\\bPAP\\b", options: .regularExpression) != nil || className.range(of: "Advanced") != nil || className.range(of: "Independent Study and Mentorship") != nil || className.range(of: "Academic Decathlon") != nil {
                print("\(className) is 5.5")
                return 5.5
            }
            else {
                print("\(className) is 5.0")
                return 5.0
            }
        }
    }

    private struct MelissaISDWeights: HACDistrictWeights {
        func weight(for className: String) -> Double {
            if className.range(of: "\\bAdv\\b", options: .regularExpression) != nil || className.range(of: "\\bDC\\b", options: .regularExpression) != nil || className.range(of: "\\bIB\\b", options: .regularExpression) != nil {
                print("\(className) is 5.0")
                return 5.0
            }
            else{
                print("\(className) is 4.0")
                return 4.0
            }
        }
    }

}
