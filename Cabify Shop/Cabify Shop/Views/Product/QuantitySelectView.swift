//
//  QuantitySelectView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct QuantitySelectView: View {
    
    let viewHeight: CGFloat
    let padding: CGFloat
    @Binding var quantity: Int
    
    private let subtractString = "-"
    private let addString = "+"
    
    var body: some View {
        
        let cornerRadius: CGFloat = (viewHeight + padding)/2
        
        HStack {
            Button {
                
            } label: {
                Text(subtractString)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
            }
            Divider()
                .background(Color.black)
            Text("\(quantity)")
                .frame(maxWidth: .infinity)
            Divider()
                .background(Color.black)
            Button {
                
            } label: {
                Text(addString)
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
        
        QuantitySelectView(viewHeight: 26,
                           padding: 5,
                           quantity: quantity)
    }
}
