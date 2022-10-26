//
//  RecipeRepositoryImpl.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class RecipeRepositoryImpl: RecipeRepositoryProtocol {

    var networkManager: NetworkManagerProtocol
    let localStore: TempMemoryStore = .init()
    
    internal init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getRandomRecipes() async -> Result<[RecipeModel], NetworkError> {
        let result = await networkManager.getRandomRecipies(with: .init())
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    func saveToFavorite(recipe: RecipeModel) async -> Result<Bool, NetworkError> {
        

        if let _ = localStore.recipeFavorites.first(where: {$0.id == recipe.id }) {
            return .failure(.diskSaveError)
        } else {
            localStore.recipeFavorites.append(recipe)
            return .success(true)
        }
    }
    
    func saveLike(recipe: RecipeModel) async -> Result<Bool, NetworkError> {
        

        if let _ = localStore.recipeLikes.first(where: {$0.id == recipe.id }) {
            return .failure(.diskSaveError)
        } else {
            localStore.recipeLikes.append(recipe)
            return .success(true)
        }
    }

}

