//
//  PriceCartView.swift
//  Cabify Shop
//
//  Created by iakalann on 20/04/2023.
//

import SwiftUI
import ProductsService

struct PriceCartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    @Binding var quantity: Int
    let product: Product
    
    var body: some View {
        let originalPrice = product.price * Float(quantity)
        if let type = product.type,
           viewModel.shouldApplyDiscount(for: type, quantity: quantity) {
            HStack {
                let discountedPrice = viewModel.getDiscountedPrice(for: product, quantity: quantity)
                Text("\(viewModel.formattedPrice(originalPrice))")
                    .foregroundColor(.gray)
                    .strikethrough()
                Text("\(viewModel.formattedPrice(discountedPrice))")
                    .bold()
                    .foregroundColor(.accentColor)
            }
        } else {
            Text("\(viewModel.formattedPrice(originalPrice))")
        }
    }
    
}
