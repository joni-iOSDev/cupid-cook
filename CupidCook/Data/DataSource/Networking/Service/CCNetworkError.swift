//
//  CCNetworkError.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case missingUrl = "URL is nil"
    case unwrapperError = "There was an error during the unwrap data"
    case diskSaveError = "There was an error on saving disk"
}

public enum DiscoverRecipeError: String, Error {
    case unwrapperError = "There was an error during the unwrap data"
    case retry = "There was an error, please retry again"
    case recipeFound = "This recipe was found, please save other"
}
