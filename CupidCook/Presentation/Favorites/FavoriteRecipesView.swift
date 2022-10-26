//
//  FavoriteRecipesView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation
import SwiftUI

struct FavoriteRecipesView: View {
    
    @ObservedObject var viewModel: FavoriteRecipesViewModel = .init(getRecipesUseCase: DependencyInjectionResolver.shared.resolve(GetRecipesUseCaseProtocol.self))
    
    var body: some View {
            List {
                ForEach(viewModel.favorites, id: \.self) { favorite in
                    NavigationLink {
                        RecipeDetailView(recipeId: favorite.id)
                    } label: {
                        HStack {
                            AsyncImage(url: favorite.getImageURL()) { recipeImg in
                                recipeImg
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFill()
                                    .cornerRadius(15)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(favorite.getTitle())
                        }
                    }
                }
                
            }// TODO: Improve the alert view with title + description
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.message))
            }
            .onAppear {
                fetchFavorites()
            }
            .navigationTitle("Favorites")
        

    }
    
    private func fetchFavorites() {
        Task {
            await viewModel.getFavorites()
        }
    }
    
}

struct FavoriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}
