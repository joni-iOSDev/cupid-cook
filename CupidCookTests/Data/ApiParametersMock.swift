//
//  ApiParametersMock.swift
//  CupidCookTests
//
//  Created by Joni Gonzalez on 25/10/2022.
//

@testable import CupidCook

struct ApiParametersMock: FoodEndpointParameters {
    
    var toDictionary: [String : Any] {
        return ["query":"pasta"]
    }
}
