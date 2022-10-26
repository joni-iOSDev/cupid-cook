//
//  GetRandomRecipes.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class GetRandomRecipes: GetRandomRecipesUseCaseProtocol {
  

    private let recipeRepository: RecipeRepositoryProtocol
    
    init(recipeRepository: RecipeRepositoryProtocol) {
        self.recipeRepository = recipeRepository
    }
    
    func execute() async -> Result<[RecipeModel], DiscoverRecipeError> {
        let result = await recipeRepository.getRandomRecipes()
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(_):
            // TODO: Validate errors
//            if failure == .unwrapperError {
//                return .failure(.retry)
//            }
//
            return .failure(.retry)
        }
    }
    
}
