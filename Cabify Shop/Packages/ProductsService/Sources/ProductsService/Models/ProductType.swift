//
//  ProductType.swift
//  
//
//  Created by iakalann on 20/04/2023.
//

import Foundation

public enum ProductType {
    case mug, tshirt, voucher
    
    public init?(code: String) {
        switch code {
        case "MUG":
            self = .mug
        case "TSHIRT":
            self = .tshirt
        case "VOUCHER":
            self = .voucher
        default:
            return nil
        }
    }
}
