//
//  FavoriteRecipesViewModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class FavoriteRecipesViewModel: ObservableObject {
    
    @Published var favorites: [Recipe] = []
    @Published var showAlert = false
    @Published var message = ""
    
    private let getRecipesUseCase: GetRecipesUseCaseProtocol
    
    init(getRecipesUseCase: GetRecipesUseCaseProtocol) {
        self.getRecipesUseCase = getRecipesUseCase
    }

    @MainActor func getFavorites() async {
        let result = await getRecipesUseCase.executeGetFavoorites()
        
        switch result {
        case .success(let success):
            favorites = success.map( { RecipeModelMapper.mapDataModelToModel($0) } )
        case .failure(let failure):
            showAlert = true
            message = failure.rawValue
        }
    }
}
