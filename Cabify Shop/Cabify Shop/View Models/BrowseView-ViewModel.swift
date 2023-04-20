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
        
        let imageSize: CGFloat = 75
        let cornerRadius: CGFloat = 10
        let shadowRadius: CGFloat = 5
        let checkoutButtonSize: CGFloat = 26
        
        @Published var isLoading = false // TODO: Update app to use isLoading (possibly an enum) to determine whether to show spinner, content, or explanation
        
        @Published var allProducts = [Product]()
        @Published var productsInCart = [Product: Int]()
        @Published var isShowingCart = false
        let service: ServiceProtocol
        
        init(service: ServiceProtocol = ProductsService()) {
            self.service = service
        }
        
        func getProducts() async {
            guard let productsList = await service.getProducts() else {
                print("Nah!")
                return
            }
            allProducts = productsList
        }
        
        func addProductsToCart(count additionalCount: Int, product: Product) {
            guard additionalCount > 0 else { return }
            guard let originalCount = productsInCart[product] else {
                productsInCart[product] = additionalCount
                return
            }
            productsInCart[product] = originalCount + additionalCount
        }
        
        func setProductsInCart(count: Int, product: Product) {
            guard count > 0 else {
                productsInCart.removeValue(forKey: product)
                return
            }
            productsInCart[product] = count
        }
        
        func quantityInCart(of product: Product) -> Int? {
            return productsInCart[product]
        }
        
        func toggleCart() {
            isShowingCart.toggle()
        }
        
        public func formattedPrice(_ value: Float) -> String {
            String(format: "$%.2f", value)
        }
        
        public func shouldApplyDiscount(for type: ProductType, quantity: Int) -> Bool {
            switch type {
            case .voucher, .tshirt:
                return quantity >= 3
            case .mug:
                return false
            }
        }
        
        public func getDiscountedPrice(for product: Product, quantity: Int) -> Float {
            switch product.type {
            case .voucher:
                return voucherDiscountedPrice(originalPrice: product.price, quantity: quantity)
            case .tshirt:
                return tshirtDiscountedPrice(originalPrice: product.price, quantity: quantity)
            case .mug, .none:
                return product.price * Float(quantity)
            }
        }
        
        private func voucherDiscountedPrice(originalPrice: Float, quantity originalQuantityOfVouchers: Int) -> Float {
            let vouchersNotIncludedInDeal = originalQuantityOfVouchers % 3
            let freeVouchers = (originalQuantityOfVouchers - vouchersNotIncludedInDeal)/3
            let totalPaidVouchers = originalQuantityOfVouchers - freeVouchers
            return Float(totalPaidVouchers) * originalPrice
        }
        
        private func tshirtDiscountedPrice(originalPrice: Float, quantity: Int) -> Float {
            let pricePerTshirt = quantity >= 3 ? Float(19) : originalPrice
            let totalPrice = pricePerTshirt * Float(quantity)
            return totalPrice
        }
    }
}
