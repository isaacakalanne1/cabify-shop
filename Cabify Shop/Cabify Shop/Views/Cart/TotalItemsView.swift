//
//  TotalItemsView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct TotalItemsView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        let totalItemsInCart = getTotalItemsInCart()
        Text("Total items in cart: \(totalItemsInCart)")
            .bold()
    }
    
    private func getTotalItemsInCart() -> Int {
        var totalCount = 0
        for product in viewModel.productsInCart.keys {
            guard let count = viewModel.productsInCart[product] else { continue }
            totalCount += count
        }
        return totalCount
    }
    
}
