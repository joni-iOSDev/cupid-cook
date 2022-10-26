//
//  LengthModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Length
class LengthModel: Codable {
    let number: Int?
    let unit: Unit?

    init(number: Int?, unit: Unit?) {
        self.number = number
        self.unit = unit
    }
}

extension LengthModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LengthModel.self, from: data)
        self.init(number: me.number, unit: me.unit)
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
        unit: Unit?? = nil
    ) -> LengthModel {
        return LengthModel(
            number: number ?? self.number,
            unit: unit ?? self.unit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
