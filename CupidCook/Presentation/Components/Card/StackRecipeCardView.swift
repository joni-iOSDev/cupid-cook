//
//  StackRecipeCardView.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import SwiftUI

struct StackRecipeCardView: View {
    
    @State var action: ((Int, SwipeType) -> ())
    
    @ObservedObject var cardViewMoldel: StackRecipeCardViewModel
    @State var offset: CGFloat = 0
    @GestureState var isDraggin: Bool = false
    @State var endSwipe: Bool = false
    
    var body: some View {
        GeometryReader { geometryProxy in
            let size = geometryProxy.size
            let frameWidth = size.width - 20.0
            let index = CGFloat(cardViewMoldel.index)
            let topOffset = (index <= 2 ? index : 2) * 30
            
            ZStack {
                AsyncImage(url: cardViewMoldel.recipe.getImageURL()) { recipeImg in
                    recipeImg
                        .resizable()
                        .frame(width: frameWidth, height: frameWidth)
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .cornerRadius(15)
                        .offset(y: -topOffset)
                    
                } placeholder: {
                    ProgressView()
                }
                
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
        }
        .offset(x: offset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
        .gesture(
            DragGesture()
                .updating($isDraggin,
                          body: { value, state, transaction in
                              state = true
                          })
                .onChanged({ value in
                    let translation = value.translation.width
                    offset = (isDraggin ? translation : .zero)
                })
                .onEnded({ value in
                    let width = rectScreenBound.width - 50
                    let translation = value.translation.width
                    
                    let checkingStatus = (translation > 0 ? translation : -translation)
                    withAnimation {
                        if checkingStatus > (width / 2) {
                            offset = (translation > 0 ? width : -width)  * 2
                            endSwipeAction()
                            if translation > 0 {
                                rightSwipe()
                            } else {
                                leftSwipe()
                            }
                        } else {
                            offset = .zero
                        }
                    }
                })
        )
    }
    
    func getRotation(angle: Double) -> Double {
        let rotation = (offset / (rectScreenBound.width - 50)) * angle
        return rotation
    }
    
    func endSwipeAction() {
        withAnimation(.none) {
            endSwipe = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //            if let _ = viewModel.recipes.first {
            //                let _ = withAnimation {
            //                    viewModel.recipes.removeFirst()
            //                }
            //            }
        }
    }
    
    func leftSwipe() {
        action(cardViewMoldel.recipe.id, .right)
    }
    
    func rightSwipe() {
        action(cardViewMoldel.recipe.id, .right)
    }
}

struct StackRecipeCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipesDiscoverView()
    }
}

public enum SwipeType {
    case right, left
}

extension View {
    var rectScreenBound: CGRect {
        return UIScreen.main.bounds
    }
}
