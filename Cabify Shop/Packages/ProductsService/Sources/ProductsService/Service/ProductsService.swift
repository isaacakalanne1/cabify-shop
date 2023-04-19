//
//  ProductsService.swift
//  Cabify Shop
//
//  Created by iakalann on 19/04/2023.
//

import Foundation

public struct ProductsService: ServiceProtocol {
    
    public init() { }
    
    public func getProducts() async -> [Product]? {
        let urlString = "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
        
        guard let url = URL(string: urlString),
              let (data, _) = try? await URLSession.shared.data(from: url),
              let decodedResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data) else { return nil }
        
        return decodedResponse.products
    }
}
