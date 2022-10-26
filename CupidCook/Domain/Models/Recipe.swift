//
//  Recipe.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

class Recipe: Codable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        // TODO: Implement a correct hash
        hasher.combine(0)
    }
    
    //TODO: Implement Model
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return true
    }
}
