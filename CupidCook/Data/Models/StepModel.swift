//
//  Step.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation
// MARK: - Step
class StepModel: Codable {
    let number: Int?
    let step: String?
    let ingredients, equipment: [EntModel]?
    let length: LengthModel?

    init(number: Int?, step: String?, ingredients: [EntModel]?, equipment: [EntModel]?, length: LengthModel?) {
        self.number = number
        self.step = step
        self.ingredients = ingredients
        self.equipment = equipment
        self.length = length
    }
}

// MARK: Step convenience initializers and mutators

extension StepModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(StepModel.self, from: data)
        self.init(number: me.number, step: me.step, ingredients: me.ingredients, equipment: me.equipment, length: me.length)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        number: Int?? = nil,
        step: String?? = nil,
        ingredients: [EntModel]?? = nil,
        equipment: [EntModel]?? = nil,
        length: LengthModel?? = nil
    ) -> StepModel {
        return StepModel(
            number: number ?? self.number,
            step: step ?? self.step,
            ingredients: ingredients ?? self.ingredients,
            equipment: equipment ?? self.equipment,
            length: length ?? self.length
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
