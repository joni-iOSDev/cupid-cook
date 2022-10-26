//
//  SearchRecipeViewModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class SearchRecipeViewModel: ObservableObject {
    
    @Published var results: [Recipe] = []
    @Published var showAlert = false
    @Published var message = ""
    
    private let useCase: SearchRecipeUseCaseProcotol
    
    init(searchUseCase: SearchRecipeUseCaseProcotol) {
        self.useCase = searchUseCase
    }

    @MainActor func runSearch(query: String) async {
        let result = await useCase.execute(query: query)
        
        switch result {
        case .success(let success):
            results = success.map( { RecipeModelMapper.mapDataModelToModel($0) } )
        case .failure(let failure):
            showAlert = true
            message = failure.rawValue
        }
    }
}
