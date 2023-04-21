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
                .padding(.top, viewModel.padding.large)
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
                    .padding(viewModel.padding.large)
                }
            }
            .frame(maxHeight: .infinity)
            TotalCartPriceView(viewModel: viewModel)
            CapsuleButtonView(viewModel: viewModel, titleString: "Proceed to Checkout") {
                viewModel.isShowingOrderConfirmedAlert.toggle()
            }
            .alert(isPresented: $viewModel.isShowingOrderConfirmedAlert) {
                Alert(title: Text("Order Confirmed"),
                      message: Text("Thank you for your purchase!"),
                      dismissButton: .default(Text("OK!")) {
                    viewModel.emptyCart()
                })
            }
        }
        .padding(viewModel.padding.standard)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}
