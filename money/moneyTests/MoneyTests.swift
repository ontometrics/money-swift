//
//  MoneyTests.swift
//  Sourcerer
//
//  Created by Rob Williams on 7/13/15.
//  Copyright © 2015 ontometrics. All rights reserved.
//

import XCTest
@testable import Money

class MoneyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLifecycle() {
        let dollarAmount = Money(amount: 24.50, currency: .USD)
        
        
        XCTAssertEqual(dollarAmount.amount, 24.50)
        XCTAssertEqual(dollarAmount.currency.symbol, "$")
        
    }
    
    func testDefaultCurrency() {
        
        let dollarAmount = Money(amount: 39.95)
        
        XCTAssertEqual(dollarAmount.currency, defaultCurrency)
    }
    
    func testAddingMoney() {
        let purchaseAmount = Money(amount: 500.00, currency: .USD)
        let tax = purchaseAmount.amount * 0.10
        
        let total = purchaseAmount + tax
        XCTAssertEqual(total.amount, 550.00)
        
    }
    
    func testComparisons() {
        let cheap = Money(amount: 5.25, currency: .USD)
        let expensive = Money(amount: 6.25, currency: .USD)
        
        XCTAssertTrue(expensive > cheap)
        XCTAssertTrue(cheap < expensive)
    }
    
    func testStringRepresentation() {
        let testPile = Money(amount: 1000.00, currency: .USD)
        
        XCTAssertEqual(testPile.description, "$1000.00")
    }
    
    func testCanParseMoneyString() {
        /*
        do {
            let money = try MoneyParser().parse("$125.00")
            print(money)
        } catch {
            XCTFail()
        }
        */
    }

}
