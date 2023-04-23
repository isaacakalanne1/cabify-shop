//
//  AccessibilityIdentifier.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import Foundation
import ProductsService

public struct AccessibilityIdentifier {
    
    // GENERAL
    static public func addQuantityButton(orientation: Orientation, product: Product) -> String {
        return "\(orientation.rawValue)\(product.code)AddQuantityButton"
    }
    static public func subtractQuantityButton(orientation: Orientation, product: Product) -> String {
        return "\(orientation.rawValue)\(product.code)SubtractQuantityButton"
    }
    static public func circleButton(type: CircleButtonType, product: Product) -> String {
        return "\(type.iconName)\(product.code)CircleButton"
    }
    
    // BROWSE
    static public let viewYourCartButton = "viewYourCartButton"
    
    // CART
    static public let cartContainerView = "cartContainerView"
    static public let emptyCartView = "emptyCartView"
    static public let cartView = "cartView"
    
    static public func noDiscountPriceText(product: Product) -> String {
        return "\(product.code)NoDiscountPriceText"
    }
    static public func discountPriceText(product: Product) -> String {
        return "\(product.code)DiscountPriceText"
    }
    
    static public let proceedToCheckoutButton = "proceedToCheckoutButton"
    static public let orderConfirmedOKButton = "orderConfirmedOKButton"
}
