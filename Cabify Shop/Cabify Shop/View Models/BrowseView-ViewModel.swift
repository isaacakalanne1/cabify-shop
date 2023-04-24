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
        
        let padding = Padding()
        let opactiy = Opacity()
        let columns = [
            GridItem(.adaptive(minimum: 140))
        ]
        
        let imageSize: CGFloat = 75
        let cornerRadius: CGFloat = 10
        let shadowRadius: CGFloat = 5
        var circleButtonSize: CGFloat {
            26 + padding.standard
        }
        
        @Published var allProducts = [Product]()
        @Published var productsInCart = [Product: Int]()
        @Published var isShowingCart = false
        @Published var isShowingOrderConfirmedAlert = false
        let service: ServiceProtocol
        
        init(service: ServiceProtocol = ProductsService()) {
            self.service = service
        }
        
        func getProducts() async {
            guard let productsList = await service.getProducts() else {
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
        
        func removeProductFromCart(_ product: Product) {
            setProductsInCart(count: 0, product: product)
        }
        
        func emptyCart() {
            productsInCart = [:]
        }
        
        func quantityInCart(of product: Product) -> Int? {
            return productsInCart[product]
        }
        
        func toggleCart() {
            isShowingCart.toggle()
        }
        
        public func formattedPrice(_ value: Float) -> String {
            String(format: "%.2f€", value)
        }
        
        public func getTotalPriceOfCart() -> Float {
            var totalPrice = Float(0)
            for product in productsInCart.keys {
                guard let quantity = productsInCart[product] else { continue }
                let price = getDiscountedPrice(for: product, quantity: quantity)
                totalPrice += price
            }
            return totalPrice
        }
        
        public func shouldApplyDiscount(for type: ProductType, quantity: Int) -> Bool {
            switch type {
            case .voucher:
                return quantity >= 2
            case .tshirt:
                return quantity >= 3
            case .mug:
                return false
            }
        }
        
        private func getDiscount(for product: Product) -> Discount? {
            switch product.type {
            case .voucher:
                return .twoForOne
            case .tshirt:
                return .reducedTo(19, amountToBuy: 3)
            case .mug, .none:
                return nil
            }
        }
        
        public func getDiscountString(for product: Product) -> String? {
            guard let discount = getDiscount(for: product) else { return nil }
            
            var discountString: String?
            switch discount {
            case .twoForOne:
                discountString = "2 for 1!"
            case .reducedTo(let price, let amountToBuy):
                discountString = "\(formattedPrice(price)) each when you buy \(amountToBuy) or more!"
            }
            return discountString
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
            let vouchersNotIncludedInDeal = originalQuantityOfVouchers % 2
            let freeVouchers = (originalQuantityOfVouchers - vouchersNotIncludedInDeal)/2
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
