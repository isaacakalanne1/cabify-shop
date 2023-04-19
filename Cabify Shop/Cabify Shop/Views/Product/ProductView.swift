//
//  ProductView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI
import ProductsService

struct ProductView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let product: Product
    
    @State var quantity: Int = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ProductImage(viewModel: viewModel, product: product)
            Text(product.name)
            Text(product.formattedPrice)
                .bold()
                .foregroundColor(.accentColor)
            HStack {
                QuantitySelectView(viewModel: viewModel, quantity: $quantity)
                AddToCartButtonView(size: viewModel.checkoutButtonSize + viewModel.standardPadding) {
                    guard quantity > 0 else { return }
                    viewModel.addProductsToCart(count: quantity,
                                                product: product)
                    quantity = 0
                    print(viewModel.productsInCart)
                }
            }
        }
        .padding(viewModel.largePadding)
        .background(Color.white
            .cornerRadius(viewModel.cornerRadius)
            .shadow(color: Color.gray,
                    radius: viewModel.shadowRadius,
                    x: 0,
                    y: 0)
        )
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: BrowseView.ViewModel(),
                    product: Product(code: "mug",
                                     name: "MUG",
                                     price: 7.5))
    }
}
