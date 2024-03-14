//
//  tip_calculatorUITests.swift
//  tip-calculatorUITests
//
//  Created by ShinIl Heo on 3/11/24.
//

import XCTest

final class tip_calculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
    }
    
    func testRegularTip() {
        screen.enterBill(amount: 100)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩100")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩100")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩0")
        
        screen.selectTip(tip: .tenPercent)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩110")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩110")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩10")
        
        screen.selectTip(tip: .fifteenPercent)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩115")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩115")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩15")
        
        screen.selectTip(tip: .twentyPercent)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩20")
        
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩20")
        
        screen.selectDecrementButton(numberOfTaps: 2)
        XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩60")
        XCTAssertEqual(screen.totalBillValueLabel.label, "₩120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "₩20")
    }
    
    func testCustomTipAndSplitBillBy2() {
      screen.enterBill(amount: 300)
      screen.selectTip(tip: .custom(value: 200))
      screen.selectIncrementButton(numberOfTaps: 1)
      XCTAssertEqual(screen.totalBillValueLabel.label, "₩500")
      XCTAssertEqual(screen.totalTipValueLabel.label, "₩200")
      XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩250")
    }
    
    func testResetButton() {
      screen.enterBill(amount: 300)
      screen.selectTip(tip: .custom(value: 200))
      screen.selectIncrementButton(numberOfTaps: 1)
      screen.doubleTapLogoView()
      XCTAssertEqual(screen.totalBillValueLabel.label, "₩0")
      XCTAssertEqual(screen.totalTipValueLabel.label, "₩0")
      XCTAssertEqual(screen.amountPerPersonValueLabel.label, "₩0")
      XCTAssertEqual(screen.billInputViewTextField.label, "")
      XCTAssertEqual(screen.quantityLabel.label, "1")
      XCTAssertEqual(screen.customTipButton.label, "Custom tip")
    }
}
