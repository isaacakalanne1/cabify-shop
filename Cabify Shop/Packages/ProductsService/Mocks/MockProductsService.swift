//
//  MockProductsService.swift
//  
//
//  Created by iakalann on 20/04/2023.
//

import Foundation
import ProductsService

struct MockProductsService: ServiceProtocol {
    
    let mockData: [Product]?
    
    init(mockData: [Product]?) {
        self.mockData = mockData
    }
    
    func getProducts() async -> [Product]? {
        return self.mockData
    }
}
