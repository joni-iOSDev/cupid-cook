//
//  SearchRecipeView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import SwiftUI

struct SearchRecipeView: View {
    
    @ObservedObject var viewModel: SearchRecipeViewModel = .init(searchUseCase: DependencyInjectionResolver.shared.resolve(SearchRecipeUseCaseProcotol.self))
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.results, id: \.self) { result in
                    Text(result.getTitle())
                }
            }
        }
        .searchable(text: $searchText).onSubmit(of: .search, runSearch)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.message))
        }
    }
    
    func runSearch() {
        Task {
            await viewModel.runSearch(query: searchText)
        }
    }
}

struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView()
    }
}
