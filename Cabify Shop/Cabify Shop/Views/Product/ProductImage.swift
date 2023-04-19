//
//  ProductImage.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI
import ProductsService

struct ProductImage: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let product: Product
    
    var body: some View {
        Group {
            if let name = product.imageName {
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
               maxHeight: viewModel.imageSize,
               alignment: .center)
    }
    
}
