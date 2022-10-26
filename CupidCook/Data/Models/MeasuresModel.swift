//
//  MeasuresModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation
// MARK: - Measures
class MeasuresModel: Codable {
    let us, metric: MetricModel?

    init(us: MetricModel?, metric: MetricModel?) {
        self.us = us
        self.metric = metric
    }
}

// MARK: Measures convenience initializers and mutators

extension MeasuresModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(MeasuresModel.self, from: data)
        self.init(us: me.us, metric: me.metric)
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
        us: MetricModel?? = nil,
        metric: MetricModel?? = nil
    ) -> MeasuresModel {
        return MeasuresModel(
            us: us ?? self.us,
            metric: metric ?? self.metric
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
