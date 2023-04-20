import XCTest
@testable import ProductsService
@testable import ProductsServiceMocks

final class ProductsServiceTests: XCTestCase {
    func testNilData() async throws {
        
        let expectedProducts: [Product]? = nil
        let service = MockProductsService(mockData: expectedProducts)
        
        let resultProducts = await service.getProducts()
        
        XCTAssertEqual(resultProducts, expectedProducts)
    }
}
