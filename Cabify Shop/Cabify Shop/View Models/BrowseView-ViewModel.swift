//
//  BrowseView-ViewModel.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

extension BrowseView {
    @MainActor class ViewModel: ObservableObject {
        
        let standardPadding: CGFloat = 5
        let columns = [
            GridItem(.adaptive(minimum: 140))
        ]
        
        @Published var products = [Product]()
        
        func getProducts() async {
            
            let urlString = "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
            
            guard let url = URL(string: urlString) else { return }
            
            guard let (data, _) = try? await URLSession.shared.data(from: url) else { return }
            
            guard let decodedResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data) else { return }
            
            products = decodedResponse.products
        }
    }
}
