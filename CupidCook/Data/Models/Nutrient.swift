//
//  Nutrient.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

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
