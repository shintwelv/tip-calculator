//
//  ScreenIdentifier.swift
//  tip-calculator
//
//  Created by ShinIl Heo on 3/14/24.
//

import Foundation

enum ScreenIdentifier {
    
    enum ResultView: String {
        case totalAmountPerPersonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }
    
    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercenButton
        case twentyPercenButton
        case customTipButton
        case customTipAlertTextField
    }
    
    enum BillInputView: String {
        case textField
    }
    
    enum LogoView: String {
        case logoView
    }
    
    enum SplitInputView: String {
        case decrementButton
        case incrementButton
        case quantityLabel
    }
}
