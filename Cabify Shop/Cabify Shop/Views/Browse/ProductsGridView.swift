//
//  ProductsGridView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct ProductsGridView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.allProducts, id: \.self) { product in
                    ProductView(viewModel: viewModel, product: product)
                }
                .padding(viewModel.padding.large)
            }
        }
    }
    
}
