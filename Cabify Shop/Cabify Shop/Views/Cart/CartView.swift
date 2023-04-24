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
            let totalPrice = viewModel.getTotalPriceOfCart()
            let formattedPrice = viewModel.formattedPrice(totalPrice)
            TotalItemsView(viewModel: viewModel)
                .padding(.top, viewModel.padding.large)
            ScrollView {
                VStack {
                    ForEach(Array(viewModel.productsInCart.keys), id: \.self) { product in
                        HStack {
                            ProductCartView(viewModel: viewModel, product: product)
                                .frame(maxWidth: .infinity, maxHeight: 110)
                            CircleButtonView(size: viewModel.circleButtonSize,
                                             type: .trash,
                                             product: product) {
                                viewModel.removeProductFromCart(product)
                            }
                        }
                    }
                    .padding(viewModel.padding.large)
                }
            }
            .frame(maxHeight: .infinity)
            TotalPriceOfCartView(viewModel: viewModel)
            CapsuleButtonView(viewModel: viewModel, titleString: "Proceed to Checkout") {
                viewModel.isShowingOrderConfirmedAlert.toggle()
            }
            .accessibilityIdentifier(AccessibilityIdentifier.proceedToCheckoutButton)
            .alert("Order Confirmed for \(formattedPrice)", isPresented: $viewModel.isShowingOrderConfirmedAlert, actions: {

                Button("OK", role: .cancel, action: {
                    viewModel.emptyCart()
                })
                .accessibilityIdentifier(AccessibilityIdentifier.orderConfirmedOKButton)

            }, message: {
                Text("Thank you for your purchase!")
            })
        }
        .padding(viewModel.padding.standard)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}
