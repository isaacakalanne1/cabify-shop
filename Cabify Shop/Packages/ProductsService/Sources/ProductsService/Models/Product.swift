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
    
    public init(code: String, name: String, price: Float) {
        self.code = code
        self.name = name
        self.price = price
    }
    
    public var imageName: String? {
        switch code {
        case "TSHIRT":
            return "shirt-icon"
        case "MUG":
            return "mug-icon"
        case "VOUCHER":
            return "voucher-icon"
        default:
            return nil
        }
    }
}
