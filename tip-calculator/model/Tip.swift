//
//  Tip.swift
//  tip-calculator
//
//  Created by ShinIl Heo on 3/11/24.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            ""
        case .tenPercent:
            "10%"
        case .fifteenPercent:
            "15%"
        case .twentyPercent:
            "20%"
        case .custom(let value):
            String(value)
        }
    }
}

