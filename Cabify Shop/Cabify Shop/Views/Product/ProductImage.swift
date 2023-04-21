//
//  ProductImage.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI
import ProductsService

struct ProductImage: View {
    
    let product: Product
    let size: CGFloat
    
    var body: some View {
        Group {
            if let name = product.imageName {
                Image(name)
                    .resizable()
            } else {
                Image(systemName: "scribble.variable")
                    .resizable()
            }
        }
        .foregroundColor(.accentColor)
        .aspectRatio(contentMode: .fit)
        .frame(height: size,
               alignment: .center)
    }
    
}
