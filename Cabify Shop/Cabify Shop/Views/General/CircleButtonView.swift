//
//  CircleButtonView.swift
//  Cabify Shop
//
//  Created by iakalann on 20/04/2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let size: CGFloat
    let type: CircleButtonType
    
    private var imageIconName: String {
        type.iconName + ".circle.fill"
    }
    
    let tappedButton: () -> Void
    
    var body: some View {
        Button {
            tappedButton()
        } label: {
            Image(systemName: imageIconName)
                .resizable()
                .foregroundColor(.accentColor)
                .frame(width: size, height: size)
        }
    }
    
}
