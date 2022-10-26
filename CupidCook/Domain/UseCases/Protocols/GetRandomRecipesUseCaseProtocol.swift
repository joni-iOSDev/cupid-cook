//
//  GetRandomRecipesUseCaseProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol GetRandomRecipesUseCaseProtocol {
    func execute() async -> Result<[RecipeModel], DiscoverRecipeError>
}
