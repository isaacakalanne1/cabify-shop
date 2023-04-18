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
        LazyVGrid(columns: viewModel.columns) {
            ForEach(viewModel.products, id: \.self) { product in
                ProductView(imageName: product.imageName,
                            productName: product.name,
                            price: product.price)
                        }
            .padding(viewModel.standardPadding)
                    }
    }
    
}
