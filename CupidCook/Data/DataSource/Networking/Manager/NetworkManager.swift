//
//  NetworkManager.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getRandomRecipies(with params: RandomRecipesParameters,_ completionHandler: @escaping (Result<[RecipeModel]?, NetworkError>) -> Void)
    func getRandomRecipies(with params: RandomRecipesParameters) async -> Result<[RecipeModel], NetworkError>
    func searcRecipe(with params: SearchRecipeParameters) async -> Result<[RecipeResult], NetworkError>
    func getRecipe(with id: Int, params: GetRecipeParameters) async -> Result<RecipeModel, NetworkError>
}

struct NetworkManager: NetworkManagerProtocol {
    
    private let routerFoodAPI = Router<SpoonacularAPI>()

    static let environment: NetworkEnvironment = .production
    
    func getRandomRecipies(with params: RandomRecipesParameters = .init()
                           ,_ completionHandler: @escaping (Result<[RecipeModel]?, NetworkError>) -> Void) {
        
        routerFoodAPI.request(expectedData: FoodAPIRandomRecipesResponse.self, from: .randomRecipes(params)) { response in
            
            switch response {
            case .success(let recipes):
                completionHandler(.success(recipes.recipes))
            case .failure(let error):
                if error.isResponseValidationError {
                    completionHandler(.failure(.missingUrl))
                }
                completionHandler(.failure(.missingUrl))
            }
        }
    }
    
    func getRandomRecipies(with params: RandomRecipesParameters) async -> Result<[RecipeModel], NetworkError> {
        let result = await routerFoodAPI.request(expectedData: FoodAPIRandomRecipesResponse.self, from: .randomRecipes(params))
        
        switch result {
        case .success(let success):
            guard let recipes = success.recipes else { return .failure(.unwrapperError)}
            return .success(recipes)
        case .failure(_):
            return .failure(.unwrapperError)
        }
    }
    
    func searcRecipe(with params: SearchRecipeParameters) async -> Result<[RecipeResult], NetworkError> {
        let result = await routerFoodAPI.request(expectedData: FoodAPISearchRecipeResponse.self, from: .searchRecipe(params))
        
        switch result {
        case .success(let success):
            guard let recipes = success.results else { return .failure(.unwrapperError)}
            return .success(recipes)
        case .failure(_):
            return .failure(.unwrapperError)
        }
    }
    
    func getRecipe(with id: Int, params: GetRecipeParameters) async -> Result<RecipeModel, NetworkError> {
        let result = await routerFoodAPI.request(expectedData: RecipeModel.self, from: .recipeInformation(id, params: params))
        
        switch result {
        case .success(let success):
            return .success(success)
        case .failure(_):
            return .failure(.failWithQuery)
        }
    }
}
