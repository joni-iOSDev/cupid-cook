//
//  DIContainer.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation
import Swinject

func buildContainer() -> Container {
    let container = Container()
    
    //MARK: Add dependecies
    container.register(NetworkManagerProtocol.self) { _ in
        return NetworkManager()
    }
    
    container.register(RecipeRepositoryProtocol.self) { _ in
        return RecipeRepositoryImpl(networkManager: container.resolve(NetworkManagerProtocol.self)!)
    }
    
    container.register(GetRandomRecipesUseCaseProtocol.self) { _ in
        return GetRandomRecipes(recipeRepository: container.resolve(RecipeRepositoryProtocol.self)!)
    }
    
    container.register(SaveRecipesUseCaseProtocol.self) { _ in
        return SaveRecipe(recipeRepository: container.resolve(RecipeRepositoryProtocol.self)!)
    }
    
    return container
}
