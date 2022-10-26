//
//  RecipeRepositoryImpl.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class RecipeRepositoryImpl: RecipeRepositoryProtocol {

    var networkManager: NetworkManagerProtocol
    var localStore: TempMemoryStoreProtocol
    
    internal init(networkManager: NetworkManagerProtocol, store: TempMemoryStoreProtocol) {
        self.networkManager = networkManager
        self.localStore = store
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
    
    func saveFavorite(recipe: RecipeModel) async -> Result<Bool, NetworkError> {

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
    
    func getLikes() async -> Result<[RecipeModel], NetworkError> {
        if localStore.recipeLikes.isEmpty {
            return .failure(.emptyDisk)
        }
        return .success(localStore.recipeLikes)
    }
    
    func getFavorites() async -> Result<[RecipeModel], NetworkError> {
        if localStore.recipeFavorites.isEmpty {
            return .failure(.emptyDisk)
        }
        return .success(localStore.recipeFavorites)
    }
    
    func search(params: SearchRecipeParameters) async -> Result<[RecipeResult], NetworkError> {
        let result = await networkManager.searcRecipe(with: params)
        
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(let failure):
            return .failure(failure)
        }
        
    }
    

}

