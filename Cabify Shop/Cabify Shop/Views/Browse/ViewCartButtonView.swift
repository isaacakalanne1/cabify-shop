//
//  ViewCartButtonView.swift
//  Cabify Shop
//
//  Created by iakalann on 19/04/2023.
//

import SwiftUI

struct ViewCartButtonView: View {
    
    let tappedButton: () -> Void
    
    var body: some View {
        Button {
            tappedButton()
        } label: {
            Text("View Your Cart")
                .foregroundColor(Color.white)
                .padding()
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }
    
}
