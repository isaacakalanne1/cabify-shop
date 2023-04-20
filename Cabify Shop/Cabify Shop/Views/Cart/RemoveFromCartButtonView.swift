//
//  RemoveFromCartButtonView.swift
//  Cabify Shop
//
//  Created by iakalann on 20/04/2023.
//

import SwiftUI

struct RemoveFromCartButtonView: View {
    
    let size: CGFloat
    private let iconName = "trash.circle.fill"
    
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
