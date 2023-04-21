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
            TotalItemsView(viewModel: viewModel)
                .padding(.top, viewModel.largePadding)
            ScrollView {
                VStack {
                    ForEach(Array(viewModel.productsInCart.keys), id: \.self) { product in
                        HStack {
                            ProductCartView(viewModel: viewModel, product: product)
                                .frame(maxWidth: .infinity, maxHeight: 110)
                            CircleButtonView(size: viewModel.circleButtonSize, type: .trash) {
                                viewModel.removeProductFromCart(product)
                            }
                        }
                    }
                    .padding(viewModel.largePadding)
                }
            }
            .frame(maxHeight: .infinity)
            TotalCartPriceView(viewModel: viewModel)
            CapsuleButtonView(viewModel: viewModel, titleString: "Proceed to Checkout") {
                
            }
        }
        .padding(viewModel.standardPadding)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}
