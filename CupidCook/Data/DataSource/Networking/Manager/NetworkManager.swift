//
//  NetworkManager.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

struct NetworkManager {
    
    private let routerFoodAPI = Router<SpoonacularAPI>()

    static let environment: NetworkEnvironment = .mock
    
    func getRandomRecipies(with params: RandomRecipesParameters = .init()
                           ,_ completionHandler: @escaping (Result<[Recipe]?, NetworkError>) -> Void) {
        
        routerFoodAPI.request(expectedData: FoodApiRandomRecipesResponse.self, from: .randomRecipes(params)) { response in
            
            switch response {
            case .success(let recipes):
                completionHandler(.success(recipes.data))
            case .failure(let error):
                if error.isResponseValidationError {
                    completionHandler(.failure(.missingUrl))
                }
                completionHandler(.failure(.missingUrl))
            }
        }
    }
}
