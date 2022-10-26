//
//  RecipeRepositoryImpl.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class RecipeRepositoryImpl: RecipeRepositoryProtocol {

    var networkManager: NetworkManagerProtocol
    
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
}

