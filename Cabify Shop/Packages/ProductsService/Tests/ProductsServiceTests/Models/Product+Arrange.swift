//
//  Product+Arrange.swift
//  
//
//  Created by iakalann on 20/04/2023.
//

import Foundation
import ProductsService

extension Product {
    var arrange: [Product] {
        return [
            .init(code: "MUG",
                  name: "Cabify Coffee Mug",
                  price: 7.5)
        ]
    }
}
