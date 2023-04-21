//
//  BannerView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct BannerView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        ZStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .overlay(Color.black.opacity(viewModel.opactiy.medium))
            Text("Choose Your Items")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
    
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(viewModel: .init())
    }
}
