//
//  GetRecipes.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class GetRecipes: GetRecipesUseCaseProtocol {

    private let recipeRepository: RecipeRepositoryProtocol
    
    init(recipeRepository: RecipeRepositoryProtocol) {
        self.recipeRepository = recipeRepository
    }
    
    func executeGetRadom() async -> Result<[RecipeModel], DiscoverRecipeError> {
        let result = await recipeRepository.getRandomRecipes()
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(_):
            // TODO: Validate errors
            return .failure(.retry)
        }
    }
    
    func executeGetFavoorites() async -> Result<[RecipeModel], DiscoverRecipeError> {
        let result = await recipeRepository.getFavorites()
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(let failure):
            // TODO: Validate errors
            if failure == .emptyDisk {
                return .failure(.isEmpty)
            }
            return .failure(.retry)
        }
    }
    
    func executeGetLikes() async -> Result<[RecipeModel], DiscoverRecipeError> {
        let result = await recipeRepository.getLikes()
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(_):
            // TODO: Validate errors
            return .failure(.retry)
        }
    }
    
    func executeGetRecipe(id: Int) async -> Result<RecipeModel, DiscoverRecipeError> {
        let result = await recipeRepository.getRecipe(id: id)
        
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(_):
            // TODO: Validate errors
            return .failure(.retry)
        }
    }
}
