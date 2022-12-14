//
//  RecipesDiscoverViewModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class RecipesDiscoverViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var message = ""
    @Published var onViewDidload = false
    @Published var recipes: [RecipeModel] = []
    
    private let getRandomRecipesUseCase: GetRecipesUseCaseProtocol
    private let saveRecipesUseCase: SaveRecipesUseCaseProtocol
    
    init(getRandomRecipesUseCase: GetRecipesUseCaseProtocol, saveRecipeUseCase: SaveRecipesUseCaseProtocol) {
        self.getRandomRecipesUseCase = getRandomRecipesUseCase
        self.saveRecipesUseCase = saveRecipeUseCase
    }
    
    func getIndex(recipe: RecipeModel) -> Int {
        return recipes.firstIndex(where: { $0.id == recipe.id }) ?? 0
    }
    
    @MainActor func getRandomRecipes() async {
        let result = await self.getRandomRecipesUseCase.executeGetRadom()
        
        switch result {
        case .success(let success):
            recipes.append(contentsOf: success)
        case .failure(let failure):
            showAlert = true
            message = failure.rawValue
        }
    }
    
    @MainActor func saveRecipe(id: Int, list: ToList) async {
        guard let recipe = recipes.first(where: { $0.id == id } ) else {
            showAlert = true
            message = "Ups! We had a problem"
            return
        }
        
        let result = await saveRecipesUseCase.execute(recitpe: recipe, list: list)
        
        switch result {
        case .success(let success):
            if success {
                // TODO: Present a message if needle
                print("123 Save OK")
            }
            
        case .failure(let failure):
            showAlert = true
            message = failure.rawValue
        }
    }
}
