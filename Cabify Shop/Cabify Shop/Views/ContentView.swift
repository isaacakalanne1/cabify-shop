//
//  ContentView.swift
//  Cabify Shop
//
//  Created by iakalann on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            banner
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
    }
    
    private var banner: some View {
        ZStack {
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .overlay(Color.black.opacity(0.5))
            Text("Choose Your Items")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
