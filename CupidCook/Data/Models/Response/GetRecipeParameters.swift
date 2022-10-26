//
//  GetRecipeParameters.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import SwiftUI

struct GetRecipeParameters: FoodEndpointParameters {
    
    var includeNutrition: Bool = false
    
    public var toDictionary: [String: Any] {
        return ["includeNutrition": includeNutrition]
    }
}
