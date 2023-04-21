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
    let orientation: Orientation
    
    private let subtractString = "-"
    private let addString = "+"
    
    var body: some View {
        
        let cornerRadius: CGFloat = (viewModel.circleButtonSize + viewModel.padding.standard)/2
        stackView
            .padding(viewModel.padding.standard)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.black.opacity(0.25), lineWidth: 1)
            )
            .padding(viewModel.padding.standard)
    }
    
    var stackView: some View {
        switch orientation {
        case .horizontal:
            return AnyView(
                HStack {
                    contentView
                }
            )
            .frame(maxWidth: .infinity, maxHeight: viewModel.circleButtonSize)
            
        case .vertical:
            return AnyView(
                VStack {
                    contentView
                }
            )
            .frame(maxWidth: viewModel.circleButtonSize, maxHeight: .infinity)
        }
    }
    
    var contentView: some View  {
        Group {
            Button {
                guard quantity > 0 else { return }
                quantity -= 1
            } label: {
                Text(subtractString)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            }
            Divider()
                .background(Color.black.opacity(0.25))
            Text("\(quantity)")
                .frame(maxWidth: .infinity, maxHeight: 20)
            Divider()
                .background(Color.black.opacity(0.25))
            Button {
                quantity += 1
            } label: {
                Text(addString)
                    .font(.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            }
        }
    }
    
}

struct QuantitySelectView_Previews: PreviewProvider {
    
    static var previews: some View {
        let quantity: Binding<Int> = .init {
            10
        } set: { _ in
            
        }
        
        QuantitySelectView(viewModel: .init(), quantity: quantity, orientation: .horizontal)
    }
}
