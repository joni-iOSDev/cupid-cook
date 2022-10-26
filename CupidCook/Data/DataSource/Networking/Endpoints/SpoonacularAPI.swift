//
//  FoodAPI.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 23/10/2022.
//

import Foundation
import Alamofire

public protocol FoodEndpointParameters {
    var toDictionary: [String: Any] { get }
}

enum NetworkEnvironment {
    case qa
    case production
    case mock
}

public enum SpoonacularAPI {
    case randomRecipes(_ params: FoodEndpointParameters)
    case similarRecipes(_ recipeId: String)
    case searchRecipe(_ query: FoodEndpointParameters)
}

extension SpoonacularAPI: EndPointType {
    
    var baseURL: String {
        switch NetworkManager.environment {
        case .qa: return "http://localhost:3000"
        case .production: return "https://api.spoonacular.com"
        case .mock: return "http://localhost:3000"
        }
    }
    
    var path: String {
        switch self {
        case .randomRecipes:
            return "/recipes/random"
        case .similarRecipes(let recipe_id):
            return "/recipes/\(recipe_id)/similar"
        case .searchRecipe:
            return "/recipes/complexSearch"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    var task: HTTPTask? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {

        switch self {
        case .randomRecipes(let params):
            return params.toDictionary
        case .searchRecipe(let params):
            return params.toDictionary
        default:
            return [:]
        }
    }
    
}

extension Parameters {
    
    func combine(_ anotherCollection: [String: Any]) -> [String: Any] {
        var mutableSelf = self
        for (key, value) in anotherCollection {
            mutableSelf[key] = value
        }
        return mutableSelf
    }
}
