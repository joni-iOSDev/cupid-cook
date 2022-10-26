//
//  SaveRecipe.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class SaveRecipe: SaveRecipesUseCaseProtocol {

    private let recipeRepository: RecipeRepositoryProtocol
    
    init(recipeRepository: RecipeRepositoryProtocol) {
        self.recipeRepository = recipeRepository
    }
        
    func execute(recitpe: RecipeModel, list: ToList) async -> Result<Bool, DiscoverRecipeError> {
        
        let result = (list == .favorite) ? await recipeRepository.saveFavorite(recipe: recitpe) : await recipeRepository.saveLike(recipe: recitpe)
        
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(let failure):
            if failure == .diskSaveError {
                return .failure(.recipeFound)
            }
            return .failure(.unwrapperError)
        }
    }
}

public enum ToList {
    case like
    case favorite
}
