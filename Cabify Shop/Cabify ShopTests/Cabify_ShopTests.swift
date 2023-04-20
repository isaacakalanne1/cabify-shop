//
//  Cabify_ShopTests.swift
//  Cabify ShopTests
//
//  Created by iakalann on 17/04/2023.
//

import XCTest
@testable import Cabify_Shop
@testable import ProductsService
@testable import ProductsServiceMocks

final class Cabify_ShopTests: XCTestCase {

    func testSuccessFetchProducts() async throws {
        let expectedProducts: [Product]? = [.arrange]
        let mockService = MockProductsService(mockData: expectedProducts)
        
        let viewModel = await BrowseView.ViewModel(service: mockService)
        await viewModel.getProducts()
        
        let allProducts = await viewModel.allProducts
        XCTAssertEqual(allProducts, expectedProducts)
    }
    
    func testEmptyProducts() async throws {
        let expectedProducts: [Product]? = []
        let mockService = MockProductsService(mockData: expectedProducts)
        
        let viewModel = await BrowseView.ViewModel(service: mockService)
        await viewModel.getProducts()
        
        let allProducts = await viewModel.allProducts
        XCTAssertEqual(allProducts, expectedProducts)
    }
    
    func testNilProducts() async throws {
        let mockService = MockProductsService(mockData: nil)
        
        let viewModel = await BrowseView.ViewModel(service: mockService)
        await viewModel.getProducts()
        
        let allProducts = await viewModel.allProducts
        XCTAssertEqual(allProducts, [Product]())
    }

}
