//
//  RecipeDetailView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @ObservedObject var viewModel: RecipeDetailViewModel =
        .init(getRecipe: DependencyInjectionResolver.shared.resolve(GetRecipesUseCaseProtocol.self))
    
    var recipeId: Int
    
    var body: some View {
        
        HStack {
            ZStack {
                VStack {
                    AsyncImage(url: viewModel.recipeDetail?.getImageURL()) { recipeImg in
                        recipeImg
                            .resizable()
                            .frame(width: 60, height: 60)
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .cornerRadius(5)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(viewModel.recipeDetail?.getTitle() ?? "No title")
                }
            }
        }.navigationTitle("Detail")
            .onAppear {
                Task {
                    await viewModel.getRecipe(query: self.recipeId)
                }
            }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId: 716429)
    }
}
