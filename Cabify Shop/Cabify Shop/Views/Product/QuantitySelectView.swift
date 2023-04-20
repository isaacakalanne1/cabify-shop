//
//  QuantitySelectView.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI
import ProductsService

struct QuantitySelectView: View {
    
    @StateObject var viewModel: BrowseView.ViewModel
    @Binding var quantity: Int
    
    private let subtractString = "-"
    private let addString = "+"
    
    var body: some View {
        
        let buttonSize = viewModel.circleButtonSize
        let cornerRadius: CGFloat = (buttonSize + viewModel.standardPadding)/2
        
        HStack {
            Button {
                guard quantity > 0 else { return }
                quantity -= 1
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
                quantity += 1
            } label: {
                Text(addString)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: buttonSize)
        .padding(viewModel.standardPadding)
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
        
        QuantitySelectView(viewModel: .init(), quantity: quantity)
    }
}
