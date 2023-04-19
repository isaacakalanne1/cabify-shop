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
    @StateObject var productViewModel: ProductView.ViewModel
    
    @State var quantity: Int
    
    var body: some View {
        HStack {
            ProductImage(productViewModel: productViewModel)
            VStack {
                Text(productViewModel.product.name)
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity, alignment: .leading)
                Text("\(productViewModel.formattedPrice)") // TODO: Replace with PriceTextView which displays either the normal price, or the original price in strikethrough, then the discounted price in bold with the accent colour
                    .multilineTextAlignment(.leading)
                    .frame(maxHeight: .infinity, alignment: .leading)
            }
            QuantitySelectView(viewModel: viewModel,
                               productViewModel: productViewModel,
                               quantity: $quantity)
            .frame(width: 130, height: 50)
        }
        .background(Color.white
            .cornerRadius(productViewModel.cornerRadius)
            .shadow(color: Color.gray,
                    radius: productViewModel.shadowRadius,
                    x: 0,
                    y: 0)
        )
    }
    
}
