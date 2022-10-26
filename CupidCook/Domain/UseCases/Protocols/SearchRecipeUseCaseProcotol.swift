//
//  SearchRecipeUseCaseProcotol.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

protocol SearchRecipeUseCaseProcotol {
    func execute(query: String) async -> Result<[RecipeResult], SearchRecipeError>
}
