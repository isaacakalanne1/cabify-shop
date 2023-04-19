//
//  ProductImage.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct ProductImage: View {
    
    @StateObject var productViewModel: ProductView.ViewModel
    
    var body: some View {
        Group {
            if let name = productViewModel.product.imageName {
                Image(name)
                    .resizable()
            } else {
                Image(systemName: "questionmark")
                    .resizable()
            }
        }
        .foregroundColor(.accentColor)
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: .infinity,
               maxHeight: productViewModel.imageSize,
               alignment: .center)
    }
    
}
