//
//  ProductView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct ProductView: View {
    
    let imageName: String
    let productName: String
    let price: Float
    
    private let imageSize: CGFloat = 75
    
    private let checkoutButtonSize: CGFloat = 26
    private let padding: CGFloat = 5
    @State var quantity: Int = 2
    
    var body: some View {
        
        let formattedPrice = String(format: "$%.2f", price)
        
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity,
                       maxHeight: imageSize,
                       alignment: .center)
            Text(productName)
            Text(formattedPrice)
                .bold()
                .foregroundColor(.accentColor)
            HStack {
                QuantitySelectView(viewHeight: checkoutButtonSize,
                                   padding: padding,
                                   quantity: $quantity)
                Button {
                    
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.accentColor)
                            .frame(width: checkoutButtonSize + padding,
                                   height: checkoutButtonSize + padding)
                        Image(systemName: "cart.fill")
                            .foregroundColor(.white)
                    }
                }

            }
        }
        .background(Color.white)
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(imageName: "mug-icon",
                    productName: "Mug",
                    price: 7.5)
    }
}
