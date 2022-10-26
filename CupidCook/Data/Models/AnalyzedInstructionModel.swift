//
//  AnalyzedInstruction.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

class AnalyzedInstructionModel: Codable {
    let name: String?
    let steps: [StepModel]?

    init(name: String?, steps: [StepModel]?) {
        self.name = name
        self.steps = steps
    }
}

extension AnalyzedInstructionModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(AnalyzedInstructionModel.self, from: data)
        self.init(name: me.name, steps: me.steps)
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
        name: String?? = nil,
        steps: [StepModel]?? = nil
    ) -> AnalyzedInstructionModel {
        return AnalyzedInstructionModel(
            name: name ?? self.name,
            steps: steps ?? self.steps
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
