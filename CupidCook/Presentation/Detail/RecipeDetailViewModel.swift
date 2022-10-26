//
//  RecipeDetailViewModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var message = ""
    @Published var recipeDetail: Recipe?
    
    private let getRecipeUseCase: GetRecipesUseCaseProtocol
    
    init(getRecipe: GetRecipesUseCaseProtocol) {
        self.getRecipeUseCase = getRecipe
    }

    @MainActor func getRecipe(query: Int) async {
        let result = await getRecipeUseCase.executeGetRecipe(id: query)
        
        switch result {
        case .success(let success):
            recipeDetail = RecipeModelMapper.mapDataModelToModel(success)
            
        case .failure(let failure):
            showAlert = true
            message = failure.rawValue
        }
    }
}
