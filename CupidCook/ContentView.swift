//
//  ContentView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear {
            NetworkManager().getRandomRecipies { result in
                switch result {
                case .success(let success):
                    print("123 success")
                case .failure(let failure):
                    print("123 failure")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
