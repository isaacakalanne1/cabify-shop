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
            BannerView(viewModel: viewModel)
            ProductsGridView(viewModel: viewModel)
                .frame(maxHeight: .infinity,
                       alignment: .top)
            CapsuleButtonView(viewModel: viewModel, titleString: "View Your Cart") {
                viewModel.toggleCart()
            }
        }
        .task {
            await viewModel.getProducts()
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
        .sheet(isPresented: $viewModel.isShowingCart) {
            CartContainerView(viewModel: viewModel)
                .presentationDetents([.fraction(0.7)])
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
