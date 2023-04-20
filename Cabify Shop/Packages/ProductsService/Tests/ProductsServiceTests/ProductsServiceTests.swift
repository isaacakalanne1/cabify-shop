//
//  ProductsServiceTests.swift
//
//
//  Created by iakalann on 20/04/2023.
//

import XCTest
import ProductsService
@testable import ProductsServiceMocks

final class ProductsServiceTests: XCTestCase {
    
    func testSuccessGetProducts() async throws {
        
        let expectedProducts: [Product]? = [.arrange]
        let service = MockProductsService(mockData: expectedProducts)
        
        let resultProducts = await service.getProducts()
        
        XCTAssertEqual(resultProducts, expectedProducts)
    }
    
    func testEmptyProducts() async throws {
        
        let expectedProducts: [Product]? = []
        let service = MockProductsService(mockData: expectedProducts)
        
        let resultProducts = await service.getProducts()
        
        XCTAssertEqual(resultProducts, expectedProducts)
    }
    
    func testNilProducts() async throws {
        
        let expectedProducts: [Product]? = nil
        let service = MockProductsService(mockData: expectedProducts)
        
        let resultProducts = await service.getProducts()
        
        XCTAssertEqual(resultProducts, expectedProducts)
    }
}
