//
//  TotalCartPriceView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct TotalCartPriceView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        let totalPriceOfCart = getTotalPriceOfCart()
        let formattedPrice = viewModel.formattedPrice(totalPriceOfCart)
        Text("Total price of cart: \(formattedPrice)")
            .bold()
    }
    
    private func getTotalPriceOfCart() -> Float {
        var totalPrice = Float(0)
        for product in viewModel.productsInCart.keys {
            guard let quantity = viewModel.productsInCart[product] else { continue }
            let price = viewModel.getDiscountedPrice(for: product, quantity: quantity)
            totalPrice += price
        }
        return totalPrice
    }
    
}
