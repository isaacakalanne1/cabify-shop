//
//  ProductView-ViewModel.swift
//  Cabify Shop
//
//  Created by iakalann on 19/04/2023.
//

import SwiftUI
import ProductsService

extension ProductView {
    @MainActor class ViewModel: ObservableObject {
        
        let product: Product
        
        public init(product: Product) {
            self.product = product
        }
        
        let imageSize: CGFloat = 75
        let cornerRadius: CGFloat = 10
        let shadowRadius: CGFloat = 5
        let checkoutButtonSize: CGFloat = 26
    }
}
