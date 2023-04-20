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
            ForEach(Array(viewModel.productsInCart.keys), id: \.self) { product in
                HStack {
                    ProductCartView(viewModel: viewModel, product: product)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                    CircleButtonView(size: viewModel.checkoutButtonSize + viewModel.standardPadding,
                                     type: .trash) {
                        viewModel.removeProductFromCart(product)
                    }
                }
            }
            .padding(viewModel.largePadding)
        }
        .padding(viewModel.standardPadding)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}
