//
//  Cabify_ShopUITests.swift
//  Cabify ShopUITests
//
//  Created by iakalann on 17/04/2023.
//

import XCTest

final class Cabify_ShopUITests: XCTestCase {
    
    let timeout = 3
    let mugString = "MUG"
    let voucherString = "VOUCHER"
    
    var viewYourCartButton: XCUIElement {
        app.buttons["viewYourCartButton"]
    }
    
    var proceedToCheckoutButton: XCUIElement {
        app.buttons["proceedToCheckoutButton"]
    }
    
    var orderConfirmedOKButton: XCUIElement {
        app.buttons["orderConfirmedOKButton"]
    }
    
    func addToCartButton(_ productString: String) -> XCUIElement {
        app.buttons["cart\(productString)CircleButton"]
    }
    
    func removeFromCartButton(_ productString: String) -> XCUIElement {
        app.buttons["trash\(productString)CircleButton"]
    }
    
    func addQuantityOfProductButton(_ productString: String) -> XCUIElement {
        app.buttons["horizontal\(productString)AddQuantityButton"]
    }
    
    func subtractQuantityInCartButton(_ productString: String) -> XCUIElement {
        app.buttons["vertical\(productString)SubtractQuantityButton"]
    }
    
    func discountPriceText(_ productString: String) -> XCUIElement {
        app.staticTexts["\(productString)DiscountPriceText"]
    }
    
    func noDiscountPriceText(_ productString: String) -> XCUIElement {
        app.staticTexts["\(productString)NoDiscountPriceText"]
    }
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }

    func testViewYourCart_emptyCart() throws {
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        viewYourCartButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testBuy1Mug() throws {
        let productString = mugString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let priceText = noDiscountPriceText(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        proceedToCheckoutButton.tap()
        
        XCTAssertTrue(orderConfirmedOKButton.waitForExistence(timeout: TimeInterval(timeout)))
        orderConfirmedOKButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testAdd1MugToCart_ThenDeleteFromCart() throws {
        let productString = mugString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let priceText = noDiscountPriceText(productString)
        let trashButton = removeFromCartButton(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(trashButton.waitForExistence(timeout: TimeInterval(timeout)))
        trashButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testBuy2Vouchers() throws {
        let productString = voucherString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let priceText = noDiscountPriceText(productString)
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        proceedToCheckoutButton.tap()
        
        XCTAssertTrue(orderConfirmedOKButton.waitForExistence(timeout: TimeInterval(timeout)))
        orderConfirmedOKButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testViewYourCart_Buy5Vouchers() throws {
        let productString = voucherString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let priceText = discountPriceText(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        proceedToCheckoutButton.tap()
        
        XCTAssertTrue(orderConfirmedOKButton.waitForExistence(timeout: TimeInterval(timeout)))
        orderConfirmedOKButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testAdd3VouchersToCartThenDelete1() throws {
        let productString = voucherString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let discountPriceText = discountPriceText(productString)
        let subtractFromCartButton = subtractQuantityInCartButton(productString)
        let noDiscountPriceText = noDiscountPriceText(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(discountPriceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(subtractFromCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        subtractFromCartButton.tap()
        
        XCTAssertTrue(noDiscountPriceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testAddThenDelete3VouchersFromCart_viaSubtractButton() throws {
        let productString = voucherString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let discountPriceText = discountPriceText(productString)
        let subtractFromCartButton = subtractQuantityInCartButton(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(discountPriceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(subtractFromCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        subtractFromCartButton.tap()
        subtractFromCartButton.tap()
        subtractFromCartButton.tap()
        
        XCTAssertFalse(proceedToCheckoutButton.waitForExistence(timeout: TimeInterval(timeout)))
    }
    
    func testAddThenDelete3MugsFromCart_viaTrashButton() throws {
        let productString = mugString
        
        let addQuantityButton = addQuantityOfProductButton(productString)
        let addToCartButton = addToCartButton(productString)
        let priceText = noDiscountPriceText(productString)
        let trashButton = removeFromCartButton(productString)
        
        XCTAssertTrue(addQuantityButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(viewYourCartButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        addQuantityButton.tap()
        addQuantityButton.tap()
        addQuantityButton.tap()
        addToCartButton.tap()
        viewYourCartButton.tap()
        
        XCTAssertTrue(priceText.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(trashButton.waitForExistence(timeout: TimeInterval(timeout)))
        
        trashButton.tap()
        
        XCTAssertFalse(priceText.waitForExistence(timeout: TimeInterval(timeout)))
    }
}
