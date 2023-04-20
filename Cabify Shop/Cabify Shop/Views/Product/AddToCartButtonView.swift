//
//  AddToCartButtonView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct AddToCartButtonView: View {
    
    let size: CGFloat
    private let iconName = "cart.circle.fill"
    
    let tappedButton: () -> Void
    
    var body: some View {
        Button {
            tappedButton()
        } label: {
            Image(systemName: iconName)
                .resizable()
                .foregroundColor(.accentColor)
                .frame(width: size, height: size)
        }
    }
    
}

struct AddToCartButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddToCartButtonView(size: 30) { }
    }
}

