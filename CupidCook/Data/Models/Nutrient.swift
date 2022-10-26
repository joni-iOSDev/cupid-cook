//
//  Nutrient.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Nutrient
class Nutrient: Codable {
    let name: String?
    let amount: Double?
    let unit: String?

    init(name: String?, amount: Double?, unit: String?) {
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}
