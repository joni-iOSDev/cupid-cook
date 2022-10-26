//
//  EntModel.swift
//  CupidCook
//
//  Created by Joni Gonzalez on 26/10/2022.
//

import Foundation

// MARK: - Ent
class EntModel: Codable {
    let id: Int?
    let name, localizedName, image: String?
    let temperature: LengthModel?

    init(id: Int?, name: String?, localizedName: String?, image: String?, temperature: LengthModel?) {
        self.id = id
        self.name = name
        self.localizedName = localizedName
        self.image = image
        self.temperature = temperature
    }
}

// MARK: Ent convenience initializers and mutators

extension EntModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(EntModel.self, from: data)
        self.init(id: me.id, name: me.name, localizedName: me.localizedName, image: me.image, temperature: me.temperature)
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
        name: String?? = nil,
        localizedName: String?? = nil,
        image: String?? = nil,
        temperature: LengthModel?? = nil
    ) -> EntModel {
        return EntModel(
            id: id ?? self.id,
            name: name ?? self.name,
            localizedName: localizedName ?? self.localizedName,
            image: image ?? self.image,
            temperature: temperature ?? self.temperature
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
