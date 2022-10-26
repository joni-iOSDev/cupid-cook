//
//  ExtendedIngredientModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - ExtendedIngredient
class ExtendedIngredientModel: Codable {
    let id: Int?
    let aisle, image: String?
    let consistency: Consistency?
    let name: String?
    let nameClean: String?
    let original, originalName: String?
    let amount: Double?
    let unit: String?
    let meta: [String]?
    let measures: MeasuresModel?

    init(id: Int?, aisle: String?, image: String?, consistency: Consistency?, name: String?, nameClean: String?, original: String?, originalName: String?, amount: Double?, unit: String?, meta: [String]?, measures: MeasuresModel?) {
        self.id = id
        self.aisle = aisle
        self.image = image
        self.consistency = consistency
        self.name = name
        self.nameClean = nameClean
        self.original = original
        self.originalName = originalName
        self.amount = amount
        self.unit = unit
        self.meta = meta
        self.measures = measures
    }
}

// MARK: ExtendedIngredient convenience initializers and mutators

extension ExtendedIngredientModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(ExtendedIngredientModel.self, from: data)
        self.init(id: me.id, aisle: me.aisle, image: me.image, consistency: me.consistency, name: me.name, nameClean: me.nameClean, original: me.original, originalName: me.originalName, amount: me.amount, unit: me.unit, meta: me.meta, measures: me.measures)
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
        id: Int?? = nil,
        aisle: String?? = nil,
        image: String?? = nil,
        consistency: Consistency?? = nil,
        name: String?? = nil,
        nameClean: String?? = nil,
        original: String?? = nil,
        originalName: String?? = nil,
        amount: Double?? = nil,
        unit: String?? = nil,
        meta: [String]?? = nil,
        measures: MeasuresModel?? = nil
    ) -> ExtendedIngredientModel {
        return ExtendedIngredientModel(
            id: id ?? self.id,
            aisle: aisle ?? self.aisle,
            image: image ?? self.image,
            consistency: consistency ?? self.consistency,
            name: name ?? self.name,
            nameClean: nameClean ?? self.nameClean,
            original: original ?? self.original,
            originalName: originalName ?? self.originalName,
            amount: amount ?? self.amount,
            unit: unit ?? self.unit,
            meta: meta ?? self.meta,
            measures: measures ?? self.measures
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Consistency: String, Codable {
    case liquid = "LIQUID"
    case solid = "SOLID"
}
