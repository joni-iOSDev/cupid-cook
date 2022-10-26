//
//  StackRecipeCardViewModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation
class StackRecipeCardViewModel: ObservableObject {
    
    @Published var recipe: Recipe = .empty
    @Published var index: Int
    
    init(recipe: RecipeModel, currentIndex: Int) {
        self.recipe = RecipeModelMapper.mapDataModelToModel(recipe)
        self.index = currentIndex
    }
}

