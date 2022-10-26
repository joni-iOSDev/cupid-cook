//
//  GetRandomRecipesUseCaseProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol GetRecipesUseCaseProtocol {
    func executeGetRadom() async -> Result<[RecipeModel], DiscoverRecipeError>
    func executeGetFavoorites() async -> Result<[RecipeModel], DiscoverRecipeError>
    func executeGetLikes() async -> Result<[RecipeModel], DiscoverRecipeError>
}
