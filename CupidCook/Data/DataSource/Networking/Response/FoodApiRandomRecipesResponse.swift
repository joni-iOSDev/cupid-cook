//
//  FoodApiRandomRecipesResponse.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class FoodApiRandomRecipesResponse: Decodable {
    
    private(set) var data: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case data = "recipes"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let dataRecipes = try? container.decode([Recipe].self, forKey: .data) {
            self.data = dataRecipes
        } else {
            throw NetworkError.unwrapperError
        }
    }
}
