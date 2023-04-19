//
//  BrowseView-ViewModel.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI
import ProductsService

extension BrowseView {
    @MainActor class ViewModel: ObservableObject {
        
        let standardPadding: CGFloat = 5
        let largePadding: CGFloat = 10
        let columns = [
            GridItem(.adaptive(minimum: 140))
        ]
        
        @Published var isLoading = false // TODO: Update app to use isLoading (possibly an enum) to determine whether to show spinner, content, or explanation
        
        @Published var allProducts = [Product]()
        @Published var productsInCart = [Product: Int]()
        @Published var isShowingCart = false
        let service: ServiceProtocol
        
        init(service: ServiceProtocol = ProductsService()) {
            self.service = service
        }
        
        func getProducts() async {
            guard let productsList = await service.getProducts() else { return }
            allProducts = productsList
        }
        
        func addProductsToCart(count additionalCount: Int, product: Product) {
            guard let originalCount = productsInCart[product] else {
                productsInCart[product] = additionalCount
                return
            }
            productsInCart[product] = originalCount + additionalCount
        }
        
        func removeProductFromCart(product: Product) {
            
        }
        
        func toggleCart() {
            isShowingCart.toggle()
        }
    }
}
