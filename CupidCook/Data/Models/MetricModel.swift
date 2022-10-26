//
//  MetricModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Metric
class MetricModel: Codable {
    let amount: Double?
    let unitShort, unitLong: String?

    init(amount: Double?, unitShort: String?, unitLong: String?) {
        self.amount = amount
        self.unitShort = unitShort
        self.unitLong = unitLong
    }
}

// MARK: Metric convenience initializers and mutators

extension MetricModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(MetricModel.self, from: data)
        self.init(amount: me.amount, unitShort: me.unitShort, unitLong: me.unitLong)
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
        amount: Double?? = nil,
        unitShort: String?? = nil,
        unitLong: String?? = nil
    ) -> MetricModel {
        return MetricModel(
            amount: amount ?? self.amount,
            unitShort: unitShort ?? self.unitShort,
            unitLong: unitLong ?? self.unitLong
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
