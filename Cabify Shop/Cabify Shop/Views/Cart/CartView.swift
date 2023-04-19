//
//  CartView.swift
//  Cabify Shop
//
//  Created by iakalann on 19/04/2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        VStack {
            ForEach(Array(viewModel.productsInCart.keys), id: \.self) {
                if let quantity = viewModel.quantityInCart(of: $0) {
                    ProductCartView(viewModel: viewModel,
                                    product: $0,
                                    quantity: quantity)
                    .frame(height: 100)
                }
            }
            .padding(viewModel.standardPadding)
        }
    }
    
}
