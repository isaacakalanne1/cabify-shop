//
//  CartContainerView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct CartContainerView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        if viewModel.productsInCart.isEmpty {
            EmptyCartView(viewModel: viewModel)
        } else {
            CartView(viewModel: viewModel)
        }
    }
    
}
