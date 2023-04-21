//
//  EmptyCartView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct EmptyCartView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    
    var body: some View {
        VStack {
            Text("Your cart is empty")
                .bold()
                .foregroundColor(.accentColor)
                .padding(viewModel.padding.standard)
            Text("Grab some items!")
                .padding(viewModel.padding.standard)
        }
    }
    
}
