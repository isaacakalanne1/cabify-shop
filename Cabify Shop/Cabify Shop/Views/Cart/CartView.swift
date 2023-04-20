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
                if viewModel.quantityInCart(of: $0) != nil {
                    ProductCartView(viewModel: viewModel, product: $0)
                        .frame(height: 120)
                }
            }
            .padding(viewModel.largePadding)
        }
        .padding(viewModel.standardPadding)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}
