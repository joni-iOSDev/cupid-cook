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
    
    private let getRandomRecipesUseCase: GetRandomRecipesUseCaseProtocol
    
    init(getRandomRecipesUseCase: GetRandomRecipesUseCaseProtocol) {
        self.getRandomRecipesUseCase = getRandomRecipesUseCase
    }
    
    func getIndex(recipe: RecipeModel) -> Int {
        return recipes.firstIndex(where: { $0.id == recipe.id }) ?? 0
    }
    
    @MainActor func getRandomRecipes() async {
        let result = await self.getRandomRecipesUseCase.execute()
        
        switch result {
        case .success(let success):
            recipes = success
        case .failure(let failure):
            showAlert = true
            message = failure.localizedDescription
        }
    }
}
