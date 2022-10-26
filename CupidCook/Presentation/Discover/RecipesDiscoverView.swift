//
//  RecipesDiscoverView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import SwiftUI

struct RecipesDiscoverView: View {
    
    @ObservedObject var viewModel: RecipesDiscoverViewModel =
        .init(getRandomRecipesUseCase: DependencyInjectionResolver.shared.resolve(GetRandomRecipesUseCaseProtocol.self))
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                NavigationLink {
                    Text("Hello, world!")
                } label: {
                    Text("Hello, world!")

                }

            }
            .padding()
            .onAppear {
                Task {
                    if !viewModel.onViewDidload {
                        viewModel.onViewDidload = true
                        await viewModel.getRandomRecipes()
                    }
                }

            }
        }
    }
}
struct RecipesDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}
