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
    
    func testViewYourCart_AddMugToCart() throws {
        let app = XCUIApplication()
        app.launch()

        let timeout = 3
        let addQuantityButton = app.buttons["horizontalMUGAddQuantityButton"]
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        addQuantityButton.tap()
        
        let addToCartButton = app.buttons["cartMUGCircleButton"]
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        addToCartButton.tap()
        
        let viewYourCartButton = app.buttons["viewYourCartButton"]
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        viewYourCartButton.tap()
        
        let emptyCartView = app.buttons["proceedToCheckoutButton"]
        XCTAssertTrue(emptyCartView.waitForExistence(timeout: TimeInterval(timeout)))
    }
}
