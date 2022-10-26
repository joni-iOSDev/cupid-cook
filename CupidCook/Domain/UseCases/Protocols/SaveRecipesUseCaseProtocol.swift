//
//  SaveRecipesUseCaseProtocol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

protocol SaveRecipesUseCaseProtocol {
    func execute(recitpe: RecipeModel, list: ToList) async -> Result<Bool, DiscoverRecipeError>
}
