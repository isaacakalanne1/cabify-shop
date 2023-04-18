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
        
        VStack {
            BannerView()
            ProductsGridView(viewModel: viewModel)
        }
        .task {
            await viewModel.getProducts()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
