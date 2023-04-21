//
//  CapsuleButtonView.swift
//  Cabify Shop
//
//  Created by iakalann on 21/04/2023.
//

import SwiftUI

struct CapsuleButtonView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    let titleString: String
    let tappedButton: () -> Void
    
    var body: some View {
        Button {
            tappedButton()
        } label: {
            Text(titleString)
                .foregroundColor(Color.white)
                .padding(viewModel.extraLargePadding)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }
    
}
