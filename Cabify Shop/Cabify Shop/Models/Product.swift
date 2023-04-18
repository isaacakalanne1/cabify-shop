//
//  Product.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import Foundation

struct Product: Codable, Hashable {
    let code: String
    let name: String
    let price: Float
    
    var imageName: String? {
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
