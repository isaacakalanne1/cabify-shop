//
//  TotalPriceOfCartView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct TotalPriceOfCartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        let totalPriceOfCart = viewModel.getTotalPriceOfCart()
        let formattedPrice = viewModel.formattedPrice(totalPriceOfCart)
        Text("Total price of cart: \(formattedPrice)")
            .bold()
    }
    
}
