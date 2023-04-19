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
        let columns = [
            GridItem(.adaptive(minimum: 140))
        ]
        
        @Published var isLoading = false // TODO: Update app to use isLoading (possibly an enum) to determine whether to show spinner, content, or explanation
        
        @Published var products = [Product]()
        let service: ServiceProtocol
        
        init(service: ServiceProtocol = ProductsService()) {
            self.service = service
        }
        
        func getProducts() async {
            guard let productsList = await service.getProducts() else { return }
            products = productsList
        }
    }
}
