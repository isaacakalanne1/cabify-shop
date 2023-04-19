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
    
    @State var quantity: Int
    
    var body: some View {
        HStack {
            ProductImage(viewModel: viewModel, product: product)
            VStack {
                Text(product.name)
                    .frame(maxHeight: .infinity, alignment: .leading)
                Text("\(product.formattedPrice)") // TODO: Replace with PriceTextView which displays either the normal price, or the original price in strikethrough, then the discounted price in bold with the accent colour
                    .frame(maxHeight: .infinity, alignment: .leading)
            }
            QuantitySelectView(viewModel: viewModel, quantity: $quantity)
                .frame(width: 130, height: 50)
        }
        .background(Color.white
            .cornerRadius(viewModel.cornerRadius)
            .shadow(color: Color.gray,
                    radius: viewModel.shadowRadius,
                    x: 0,
                    y: 0)
        )
    }
    
}
