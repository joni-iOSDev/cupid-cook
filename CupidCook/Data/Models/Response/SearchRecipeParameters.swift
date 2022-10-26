//
//  SearchRecipeParameters.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

struct SearchRecipeParameters: FoodEndpointParameters {
    /// The (natural language) recipe search query.
    var query: String
    /// The number of expected results (between 1 and 100).
    var number: Int = 12
    
    public var toDictionary: [String: Any] {
        return ["query": query, "number": number]
    }
}
