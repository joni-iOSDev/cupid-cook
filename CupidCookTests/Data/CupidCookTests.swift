//
//  CupidCookTests.swift
//  CupidCookTests
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import XCTest
@testable import CupidCook

final class CupidCookTests: XCTestCase {
    
    var paramsMock: FoodEndpointParameters!

    override func setUpWithError() throws {
        paramsMock = ApiParametersMock()
    }

    func testEndpointsStrings() throws {
        
        let searchRecipe: SpoonacularAPI = .searchRecipe(paramsMock)
        XCTAssertTrue(searchRecipe.path == "/recipe/complexSearch")
        XCTAssertTrue(searchRecipe.httpMethod == .get)

        
        let randomRecipes: SpoonacularAPI = .randomRecipes(paramsMock)
        XCTAssertTrue(randomRecipes.path == "/recipes/random")
        XCTAssertTrue(randomRecipes.httpMethod == .get)

        
        let similarRecipes: SpoonacularAPI = .similarRecipes("123")
        XCTAssertTrue(similarRecipes.path == "/recipes/123/similar")
        XCTAssertTrue(similarRecipes.httpMethod == .get)

        
    }

}

