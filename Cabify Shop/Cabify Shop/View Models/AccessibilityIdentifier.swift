//
//  AccessibilityIdentifier.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import Foundation
import ProductsService

public struct AccessibilityIdentifier {
    // BROWSE
    static public let viewYourCartButton = "viewYourCartButton"
    
    // CART
    static public let cartContainerView = "cartContainerView"
    static public let emptyCartView = "emptyCartView"
    static public let cartView = "cartView"
    static public func addQuantityButton(orientation: Orientation, product: Product) -> String {
        return "\(orientation.rawValue)\(product.code)AddQuantityButton"
    }
}
