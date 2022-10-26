
import Foundation

class RecipeModel: Codable, Hashable {

    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: String?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText: String?
    let license: String?
    let sourceName: String?
    let pricePerServing: Double?
    let extendedIngredients: [ExtendedIngredientModel]?
    let id: Int
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType: String?
    let summary: String?
    let cuisines, dishTypes, diets, occasions: [String]?
    let instructions: String?
    let analyzedInstructions: [AnalyzedInstructionModel]?
    let originalID: JSONNull?
    let spoonacularSourceURL: String?

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, license, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case image, imageType, summary, cuisines, dishTypes, diets, occasions, instructions, analyzedInstructions
        case originalID = "originalId"
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }

    init(vegetarian: Bool? = nil, vegan: Bool? = nil, glutenFree: Bool? = nil, dairyFree: Bool? = nil, veryHealthy: Bool? = nil, cheap: Bool? = nil, veryPopular: Bool? = nil, sustainable: Bool? = nil, lowFodmap: Bool? = nil , weightWatcherSmartPoints: Int? = nil, gaps: String? = nil, preparationMinutes: Int? = nil, cookingMinutes: Int? = nil, aggregateLikes: Int? = nil, healthScore: Int? = nil, creditsText: String? = nil, license: String? = nil, sourceName: String? = nil, pricePerServing: Double? = nil, extendedIngredients: [ExtendedIngredientModel]? = nil, id: Int, title: String? = nil, readyInMinutes: Int? = nil, servings: Int? = nil, sourceURL: String? = nil, image: String? = nil, imageType: String? = nil, summary: String? = nil, cuisines: [String]? = nil, dishTypes: [String]? = nil, diets: [String]? = nil, occasions: [String]? = nil, instructions: String? = nil, analyzedInstructions: [AnalyzedInstructionModel]? = nil, originalID: JSONNull? = nil, spoonacularSourceURL: String? = nil) {
        self.vegetarian = vegetarian
        self.vegan = vegan
        self.glutenFree = glutenFree
        self.dairyFree = dairyFree
        self.veryHealthy = veryHealthy
        self.cheap = cheap
        self.veryPopular = veryPopular
        self.sustainable = sustainable
        self.lowFodmap = lowFodmap
        self.weightWatcherSmartPoints = weightWatcherSmartPoints
        self.gaps = gaps
        self.preparationMinutes = preparationMinutes
        self.cookingMinutes = cookingMinutes
        self.aggregateLikes = aggregateLikes
        self.healthScore = healthScore
        self.creditsText = creditsText
        self.license = license
        self.sourceName = sourceName
        self.pricePerServing = pricePerServing
        self.extendedIngredients = extendedIngredients
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.sourceURL = sourceURL
        self.image = image
        self.imageType = imageType
        self.summary = summary
        self.cuisines = cuisines
        self.dishTypes = dishTypes
        self.diets = diets
        self.occasions = occasions
        self.instructions = instructions
        self.analyzedInstructions = analyzedInstructions
        self.originalID = originalID
        self.spoonacularSourceURL = spoonacularSourceURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RecipeModel, rhs: RecipeModel) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: Recipe convenience initializers and mutators

extension RecipeModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(RecipeModel.self, from: data)
        self.init(vegetarian: me.vegetarian, vegan: me.vegan, glutenFree: me.glutenFree, dairyFree: me.dairyFree, veryHealthy: me.veryHealthy, cheap: me.cheap, veryPopular: me.veryPopular, sustainable: me.sustainable, lowFodmap: me.lowFodmap, weightWatcherSmartPoints: me.weightWatcherSmartPoints, gaps: me.gaps, preparationMinutes: me.preparationMinutes, cookingMinutes: me.cookingMinutes, aggregateLikes: me.aggregateLikes, healthScore: me.healthScore, creditsText: me.creditsText, license: me.license, sourceName: me.sourceName, pricePerServing: me.pricePerServing, extendedIngredients: me.extendedIngredients, id: me.id, title: me.title, readyInMinutes: me.readyInMinutes, servings: me.servings, sourceURL: me.sourceURL, image: me.image, imageType: me.imageType, summary: me.summary, cuisines: me.cuisines, dishTypes: me.dishTypes, diets: me.diets, occasions: me.occasions, instructions: me.instructions, analyzedInstructions: me.analyzedInstructions, originalID: me.originalID, spoonacularSourceURL: me.spoonacularSourceURL)
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

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
