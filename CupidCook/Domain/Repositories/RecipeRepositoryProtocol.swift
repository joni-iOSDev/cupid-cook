//
//  RecipeRepositoryProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func getRandomRecipes() async -> Result<[RecipeModel], NetworkError>
    func saveToFavorite(recipe: RecipeModel) async -> Result<Bool, NetworkError>
    func saveLike(recipe: RecipeModel) async -> Result<Bool, NetworkError>
}
