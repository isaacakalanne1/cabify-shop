//
//  AmountInCartView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI
import ProductsService

struct AmountInCartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let amountInCart: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: viewModel.circleButtonSize, height: viewModel.circleButtonSize)
            Text("\(amountInCart)")
                .bold()
                .foregroundColor(.white)
        }
    }
    
}
