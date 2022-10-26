//
//  RecipesDiscoverView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import SwiftUI

struct RecipesDiscoverView: View {
    
    @ObservedObject var viewModel: RecipesDiscoverViewModel =
        .init(getRandomRecipesUseCase: DependencyInjectionResolver.shared.resolve(GetRandomRecipesUseCaseProtocol.self))
    @State private var showingSearchRecipe = false
    @State var swipeAction: ((Int, SwipeType) -> ())?

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Favorites") {
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        Text("Discover")
                            .font(.title.bold())
                    }
                    .padding()
                
                ZStack {
                    if viewModel.recipes.isEmpty {
                        HStack {
                            Text("Loading... ")
                            ProgressView()
                        }
                    } else {
                        ForEach(viewModel.recipes.reversed(), id: \.self) { recipe in
                            
                            StackRecipeCardView(action: { id, swipe in
                                print("123 swipe")
                                actionSwipe(id: id, swipe: swipe)

                            }, cardViewMoldel:
                                    .init(recipe: recipe,
                                          currentIndex: viewModel.getIndex(recipe: recipe)))
                        }
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                // MARK: - Buttons
                HStack(spacing: 15) {

                    CircleButton(name: Constant.search,
                                 color: Color.gray,
                                 sizeByPriority: .low) {
                        showingSearchRecipe.toggle()
                    }.sheet(isPresented: $showingSearchRecipe, content: SearchRecipe)
                    
                    CircleButton(name: Constant.unLinke,
                                 color: Color.pink,
                                 sizeByPriority: .medium) {  }
                    
                    CircleButton(name: Constant.favorite,
                                 color: Color.yellow,
                                 sizeByPriority: .low) {  }
                    
                    CircleButton(name: Constant.like,
                                 color: Color.green,
                                 sizeByPriority: .high) { }
                    
                }
                .padding(.bottom)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Ups there was an error"))
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
                Task {
                    if !viewModel.onViewDidload {
                        viewModel.onViewDidload = true
                        await viewModel.getRandomRecipes()
                    }
                }
            }
        }
    }
    
    private func SearchRecipe() -> some View {
        return SearchRecipeView()
    }
    
    private func actionSwipe(id: Int, swipe: SwipeType) {
        updateStack()
    }
    
    private func updateStack() {
        if let _ = viewModel.recipes.reversed().first {
            let _ = withAnimation {
                viewModel.recipes.removeFirst()
            }
        }
    }
}
struct RecipesDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesDiscoverView()
    }
}

fileprivate struct Constant {
    static let like = "suit.heart.fill"
    static let favorite = "star.fill"
    static let unLinke = "xmark"
    static let search = "magnifyingglass"
}
