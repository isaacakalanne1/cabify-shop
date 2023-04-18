//
//  BrowseView.swift
//  Cabify Shop
//
//  Created by iakalann on 17/04/2023.
//

import SwiftUI

struct BrowseView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: viewModel.minimumColumnSize))
        ]
        
        VStack {
            banner
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products, id: \.self) { product in
                    ProductView(imageName: product.imageName,
                                productName: product.name,
                                price: product.price)
                            }
                .padding(viewModel.standardPadding)
                        }
        }
        .task {
            await viewModel.getProducts()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
    }
    
    private var banner: some View {
        ZStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .overlay(Color.black.opacity(0.5))
            Text("Choose Your Items")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
