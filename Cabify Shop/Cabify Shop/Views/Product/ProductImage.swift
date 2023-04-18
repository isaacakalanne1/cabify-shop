//
//  ProductImage.swift
//  Cabify Shop
//
//  Created by iakalann on 18/04/2023.
//

import SwiftUI

struct ProductImage: View {
    
    let imageName: String?
    
    var body: some View {
        if let name = imageName {
            return Image(name)
                .resizable()
        } else {
            return Image(systemName: "questionmark")
                .resizable()
        }
    }
    
}
