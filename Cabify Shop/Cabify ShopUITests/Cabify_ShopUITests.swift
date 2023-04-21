//
//  Cabify_ShopUITests.swift
//  Cabify ShopUITests
//
//  Created by iakalann on 17/04/2023.
//

import XCTest

final class Cabify_ShopUITests: XCTestCase {

    func testViewYourCart_emptyCart() throws {
        let app = XCUIApplication()
        app.launch()

        let timeout = 2
        let viewYourCartButton = app.buttons["viewYourCartButton"]
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        viewYourCartButton.tap()
        
        let emptyCartView = app.buttons["proceedToCheckoutButton"]
        XCTAssertFalse(emptyCartView.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testViewYourCart_Add1MugToCart() throws {
        let app = XCUIApplication()
        app.launch()

        let timeout = 3
        let productString = "MUG"
        
        let addQuantityButton = app.buttons["horizontal\(productString)AddQuantityButton"]
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        addQuantityButton.tap()
        
        let addToCartButton = app.buttons["cart\(productString)CircleButton"]
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        addToCartButton.tap()
        
        let viewYourCartButton = app.buttons["viewYourCartButton"]
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        viewYourCartButton.tap()
        
        let emptyCartView = app.buttons["proceedToCheckoutButton"]
        XCTAssertTrue(emptyCartView.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testViewYourCart_Add2VouchersToCart() throws {
        let app = XCUIApplication()
        app.launch()

        let timeout = 3
        let productString = "VOUCHER"
        
        let addQuantityButton = app.buttons["horizontal\(productString)AddQuantityButton"]
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        addQuantityButton.tap()
        addQuantityButton.tap()
        
        let addToCartButton = app.buttons["cart\(productString)CircleButton"]
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        addToCartButton.tap()
        
        let viewYourCartButton = app.buttons["viewYourCartButton"]
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        viewYourCartButton.tap()
        
        let emptyCartView = app.buttons["proceedToCheckoutButton"]
        XCTAssertTrue(emptyCartView.waitForExistence(timeout: TimeInterval(timeout)))
        
        let priceText = app.staticTexts["\(productString)NoDiscountPriceText"]
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testViewYourCart_Add5VouchersToCart() throws {
        let app = XCUIApplication()
        app.launch()

        let timeout = 3
        let productString = "VOUCHER"
        
        let addQuantityButton = app.buttons["horizontal\(productString)AddQuantityButton"]
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        
        let addToCartButton = app.buttons["cart\(productString)CircleButton"]
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        addToCartButton.tap()
        
        let viewYourCartButton = app.buttons["viewYourCartButton"]
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        viewYourCartButton.tap()
        
        let emptyCartView = app.buttons["proceedToCheckoutButton"]
        XCTAssertTrue(emptyCartView.waitForExistence(timeout: TimeInterval(timeout)))
        
        let priceText = app.staticTexts["\(productString)DiscountPriceText"]
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
    }
}
