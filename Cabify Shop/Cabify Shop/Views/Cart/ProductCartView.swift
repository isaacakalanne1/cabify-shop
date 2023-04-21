//
//  ProductCartView.swift
//  Cabify Shop
//
//  Created by iakalann on 19/04/2023.
//

import SwiftUI
import ProductsService

struct ProductCartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let product: Product
    
    var body: some View {
        
        let quantity: Binding<Int> = .init {
            viewModel.productsInCart[product] ?? 0
        } set: { newValue in
            viewModel.setProductsInCart(count: newValue, product: product)
        }
        
        HStack {
            ProductImage(product: product, size: viewModel.imageSize)
                .padding(viewModel.padding.standard)
            VStack {
                Text(product.name)
                    .lineLimit(0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                PriceCartView(viewModel: viewModel, quantity: quantity, product: product)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            QuantitySelectView(viewModel: viewModel, quantity: quantity, orientation: .vertical)
        }
        .padding(viewModel.padding.standard)
        .background(Color.white
            .cornerRadius(viewModel.cornerRadius)
            .shadow(color: Color.black.opacity(viewModel.opactiy.standard),
                    radius: viewModel.shadowRadius,
                    x: 0,
                    y: 0)
        )
    }
    
}
