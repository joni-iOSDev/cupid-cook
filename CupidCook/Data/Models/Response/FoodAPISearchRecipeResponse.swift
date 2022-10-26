//
//  FoodAPISearchRecipeResponse.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - FoodAPISearchRecipeResponse
class FoodAPISearchRecipeResponse: Codable {
    let results: [RecipeResult]?
    let offset, number, totalResults: Int?

    init(results: [RecipeResult]?, offset: Int?, number: Int?, totalResults: Int?) {
        self.results = results
        self.offset = offset
        self.number = number
        self.totalResults = totalResults
    }
}



