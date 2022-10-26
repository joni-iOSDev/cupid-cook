//
//  RecipeResult.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Result
class RecipeResult: Codable {
    let id: Int
    let title: String?
    let image: String?
    let imageType: ImageType?
    let nutrition: Nutrition?

    init(id: Int, title: String?, image: String?, imageType: ImageType?, nutrition: Nutrition?) {
        self.id = id
        self.title = title
        self.image = image
        self.imageType = imageType
        self.nutrition = nutrition
    }
}
