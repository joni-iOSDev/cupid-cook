//
//  RecipeModelMapper.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

struct RecipeModelMapper {
    static func mapDataModelToModel(_ recipeDTO: RecipeModel) -> Recipe {
        return  .init(id: recipeDTO.id,
                     title: recipeDTO.title,
                     imageUrl: recipeDTO.image)
    }
    
    static func mapDataModelToModel(_ recipeDTO: RecipeResult) -> Recipe {
        return  .init(id: recipeDTO.id,
                     title: recipeDTO.title,
                     imageUrl: recipeDTO.image)
    }
}

