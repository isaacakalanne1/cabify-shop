//
//  DiscountTextView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct DiscountTextView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let discountString: String
    
    var body: some View {
        Text(discountString)
            .font(.smallCaps(.body)())
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.white)
            .padding(viewModel.standardPadding)
            .background(Color.accentColor)
            .cornerRadius(viewModel.cornerRadius)
    }
    
}
