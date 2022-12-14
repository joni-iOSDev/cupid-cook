// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let foodAPIRandomRecipesResponse = try FoodAPIRandomRecipesResponse(json)

import Foundation

// MARK: - FoodAPIRandomRecipesResponse
class FoodAPIRandomRecipesResponse: Codable {
    let recipes: [RecipeModel]?

    init(recipes: [RecipeModel]?) {
        self.recipes = recipes
    }
}

// MARK: FoodAPIRandomRecipesResponse convenience initializers and mutators
extension FoodAPIRandomRecipesResponse {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(FoodAPIRandomRecipesResponse.self, from: data)
        self.init(recipes: me.recipes)
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
        recipe: [RecipeModel]?? = nil
    ) -> FoodAPIRandomRecipesResponse {
        return FoodAPIRandomRecipesResponse(
            recipes: recipes ?? self.recipes
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
