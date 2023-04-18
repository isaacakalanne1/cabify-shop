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
    
    var body: some View {
        
        let formattedPrice = String(format: "$%.2f", price)
        
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize,
                       height: imageSize)
            Text(productName)
            Text(formattedPrice)
                .bold()
                .foregroundColor(.accentColor)
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
