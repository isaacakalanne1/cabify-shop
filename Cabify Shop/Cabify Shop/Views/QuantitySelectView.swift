//
//  QuantitySelectView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct QuantitySelectView: View {
    
    private let viewHeight: CGFloat = 26
    private let padding: CGFloat = 5
    
    @Binding var quantity: Int
    
    var body: some View {
        
        let cornerRadius: CGFloat = (viewHeight + padding)/2
        
        HStack {
            Button {
                
            } label: {
                Text("-")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
            }
            Text("\(quantity)")
            Button {
                
            } label: {
                Text("+")
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: viewHeight)
        .padding(padding)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.black,
                        lineWidth: 1)
        )
    }
    
}

struct QuantitySelectView_Previews: PreviewProvider {
    
    static var previews: some View {
        let quantity: Binding<Int> = .init {
            10
        } set: { _ in
            
        }

        
        QuantitySelectView(quantity: quantity)
    }
}
