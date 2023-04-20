//
//  Product.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import Foundation

public struct Product: Codable, Hashable {
    
    let code: String
    public let name: String
    public let price: Float
    
    var type: ProductType? {
        ProductType(code: code)
    }
    
    public init(code: String, name: String, price: Float) {
        self.code = code
        self.name = name
        self.price = price
    }
    
    public var imageName: String? {
        switch type {
        case .tshirt:
            return "shirt-icon"
        case .mug:
            return "mug-icon"
        case .voucher:
            return "voucher-icon"
        default:
            return nil
        }
    }
    
}
