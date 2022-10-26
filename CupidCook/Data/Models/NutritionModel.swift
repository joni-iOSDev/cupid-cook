//
//  NutritionModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Nutrition
class NutritionModel: Codable {
    let nutrients: [NutrientModel]?

    init(nutrients: [NutrientModel]?) {
        self.nutrients = nutrients
    }
}
