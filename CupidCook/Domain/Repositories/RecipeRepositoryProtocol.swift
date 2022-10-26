//
//  RecipeRepositoryProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func getRandomRecipes() async -> Result<[RecipeModel], NetworkError>
}
