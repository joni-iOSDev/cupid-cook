//
//  DummyTempTestLogic.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// TODO: Implement a satisfactory store
// MARK: Disclaimaer: This is a temporal store to test logic implemented

class TempMemoryStore {
    var recipeLikes: [RecipeModel] = [] {
        didSet {
            print("123 likes \(recipeLikes.count)")
        }
    }
    var recipeFavorites: [RecipeModel] = []  {
        didSet {
            print("123 favorites \(recipeFavorites.count)")
        }
    }
}
