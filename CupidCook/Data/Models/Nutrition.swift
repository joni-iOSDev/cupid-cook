//
//  Nutrition.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Nutrition
class Nutrition: Codable {
    let nutrients: [Nutrient]?

    init(nutrients: [Nutrient]?) {
        self.nutrients = nutrients
    }
}
