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
    @StateObject var productViewModel: ViewModel
    
    @State var quantity: Int = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ProductImage(productViewModel: productViewModel)
            Text(productViewModel.product.name)
            Text(productViewModel.formattedPrice)
                .bold()
                .foregroundColor(.accentColor)
            HStack {
                QuantitySelectView(viewModel: viewModel,
                                   productViewModel: productViewModel,
                                   quantity: $quantity)
                AddToCartButtonView(size: productViewModel.checkoutButtonSize + viewModel.standardPadding) {
                    guard quantity > 0 else { return }
                    viewModel.addProductsToCart(count: quantity,
                                                product: productViewModel.product)
                    quantity = 0
                    print(viewModel.productsInCart)
                }
            }
        }
        .padding(viewModel.largePadding)
        .background(Color.white
            .cornerRadius(productViewModel.cornerRadius)
            .shadow(color: Color.gray,
                    radius: productViewModel.shadowRadius,
                    x: 0,
                    y: 0)
        )
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: BrowseView.ViewModel(),
                    productViewModel: ProductView.ViewModel(product: Product(code: "mug",
                                                                             name: "MUG",
                                                                             price: 7.5)))
    }
}
