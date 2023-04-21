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
            if let discountString = viewModel.getDiscountString(for: product) {
                DiscountTextView(viewModel: viewModel, discountString: discountString)
            }
            ZStack(alignment: .topTrailing) {
                ProductImage(product: product, size: viewModel.imageSize)
                    .frame(maxWidth: .infinity)
                if let amountInCart = viewModel.productsInCart[product] {
                    AmountInCartView(viewModel: viewModel, amountInCart: amountInCart)
                }
            }
            Text(product.name)
            Text(viewModel.formattedPrice(product.price))
                .bold()
                .foregroundColor(.accentColor)
            HStack {
                QuantitySelectView(viewModel: viewModel, quantity: $quantity)
                CircleButtonView(size: viewModel.circleButtonSize, type: .cart) {
                    viewModel.addProductsToCart(count: quantity,
                                                product: product)
                    quantity = 0
                    print(viewModel.productsInCart)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(viewModel.largePadding)
        .background(Color.white
            .cornerRadius(viewModel.cornerRadius)
            .shadow(color: Color.black.opacity(0.25),
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
