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

// MARK: - Result
class RecipeResult: Codable {
    let id: Int
    let title: String?
    let image: String?
    let imageType: ImageType?
    let nutrition: Nutrition?

    init(id: Int, title: String?, image: String?, imageType: ImageType?, nutrition: Nutrition?) {
        self.id = id
        self.title = title
        self.image = image
        self.imageType = imageType
        self.nutrition = nutrition
    }
}

// MARK: - Nutrition
class Nutrition: Codable {
    let nutrients: [Nutrient]?

    init(nutrients: [Nutrient]?) {
        self.nutrients = nutrients
    }
}

// MARK: - Nutrient
class Nutrient: Codable {
    let name: Name?
    let amount: Double?
    let unit: Unit?

    init(name: Name?, amount: Double?, unit: Unit?) {
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}

enum Name: String, Codable {
    case fat = "Fat"
}

