//
//  SearchRecipe.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class SearchRecipe: SearchRecipeUseCaseProcotol {
    
    private let recipeRepository: RecipeRepositoryProtocol
    
    init(recipeRepository: RecipeRepositoryProtocol) {
        self.recipeRepository = recipeRepository
    }
    
    func execute(query: String) async -> Result<[RecipeResult], SearchRecipeError> {
        let params = SearchRecipeParameters(query: query)
        let result = await recipeRepository.search(params: params)
        
        switch result {
        case .success(let recipes):
            if recipes.isEmpty {
                return .failure(.noResult)
            }
            return .success(recipes)
        case .failure(_):
            return .failure(.noResult)
        }
    }
}
