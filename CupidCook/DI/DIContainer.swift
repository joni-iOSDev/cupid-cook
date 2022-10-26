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
    let localDB = TempMemoryStore()
    
    //MARK: Add dependecies
    container.register(NetworkManagerProtocol.self) { _ in
        return NetworkManager()
    }
    
    container.register(TempMemoryStoreProtocol.self) { _ in
        return localDB
    }
    
    container.register(RecipeRepositoryProtocol.self) { _ in
        return RecipeRepositoryImpl(networkManager: container.resolve(NetworkManagerProtocol.self)!,
                                    store: container.resolve(TempMemoryStoreProtocol.self)!)
    }
    
    container.register(GetRecipesUseCaseProtocol.self) { _ in
        return GetRecipes(recipeRepository: container.resolve(RecipeRepositoryProtocol.self)!)
    }
    
    container.register(SaveRecipesUseCaseProtocol.self) { _ in
        return SaveRecipe(recipeRepository: container.resolve(RecipeRepositoryProtocol.self)!)
    }
    
    container.register(SearchRecipeUseCaseProcotol.self) { _ in
        return SearchRecipe(recipeRepository: container.resolve(RecipeRepositoryProtocol.self)!)
    }
        
    return container
}
