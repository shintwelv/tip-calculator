//
//  CalculatorScreen.swift
//  tip-calculatorUITests
//
//  Created by ShinIl Heo on 3/14/24.
//

import XCTest

class CalculatorScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // LogoView
    var logoView: XCUIElement {
        return app.otherElements[ScreenIdentifier.LogoView.logoView.rawValue]
    }
    
    // ResultView
    var amountPerPersonValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
    }
    
    var totalBillValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
    
    // TipInputView
    var tenPercenButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.tenPercentButton.rawValue]
    }
    
    var fiftenPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.fifteenPercenButton.rawValue]
    }
    
    var twentyPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.twentyPercenButton.rawValue]
    }
    
    var customTipButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.customTipButton.rawValue]
    }
    
    var customTipAlertTextField: XCUIElement {
        return app.textFields[ScreenIdentifier.TipInputView.customTipAlertTextField.rawValue]
    }
    
    // BillInputView
    var billInputViewTextField: XCUIElement {
        return app.textFields[ScreenIdentifier.BillInputView.textField.rawValue]
    }
    
    // SplitInputView
    var decrementButton: XCUIElement {
        return app.buttons[ScreenIdentifier.SplitInputView.decrementButton.rawValue]
    }
    
    var incrementButton: XCUIElement {
        return app.buttons[ScreenIdentifier.SplitInputView.incrementButton.rawValue]
    }
    
    var quantityLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.SplitInputView.quantityLabel.rawValue]
    }
    
    // Actions
    func enterBill(amount: Double) {
        billInputViewTextField.tap()
        billInputViewTextField.typeText("\(amount)\n")
    }
    
    func selectTip(tip: Tip) {
        switch tip {
        case .tenPercent:
            tenPercenButton.tap()
        case .fifteenPercent:
            fiftenPercentButton.tap()
        case .twentyPercent:
            twentyPercentButton.tap()
        case .custom(let value):
            customTipButton.tap()
            XCTAssertTrue(customTipAlertTextField.waitForExistence(timeout: 1.0))
            customTipAlertTextField.typeText("\(value)\n")
        }
    }
    
    func selectIncrementButton(numberOfTaps: Int) {
        incrementButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func selectDecrementButton(numberOfTaps: Int) {
        decrementButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func doubleTapLogoView() {
        logoView.tap(withNumberOfTaps: 2, numberOfTouches: 1)
    }
    
    enum Tip {
        case tenPercent
        case fifteenPercent
        case twentyPercent
        case custom(value: Int)
    }
}
