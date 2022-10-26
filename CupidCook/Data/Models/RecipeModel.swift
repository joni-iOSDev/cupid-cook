
import Foundation

class RecipeModel: Codable, Hashable {

    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: Gaps?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText: CreditsText?
    let license: License?
    let sourceName: SourceName?
    let pricePerServing: Double?
    let extendedIngredients: [ExtendedIngredientModel]?
    let id: Int
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType: ImageType?
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

    init(vegetarian: Bool?, vegan: Bool?, glutenFree: Bool?, dairyFree: Bool?, veryHealthy: Bool?, cheap: Bool?, veryPopular: Bool?, sustainable: Bool?, lowFodmap: Bool?, weightWatcherSmartPoints: Int?, gaps: Gaps?, preparationMinutes: Int?, cookingMinutes: Int?, aggregateLikes: Int?, healthScore: Int?, creditsText: CreditsText?, license: License?, sourceName: SourceName?, pricePerServing: Double?, extendedIngredients: [ExtendedIngredientModel]?, id: Int, title: String?, readyInMinutes: Int?, servings: Int?, sourceURL: String?, image: String?, imageType: ImageType?, summary: String?, cuisines: [String]?, dishTypes: [String]?, diets: [String]?, occasions: [String]?, instructions: String?, analyzedInstructions: [AnalyzedInstructionModel]?, originalID: JSONNull?, spoonacularSourceURL: String?) {
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

    func with(
        vegetarian: Bool?? = nil,
        vegan: Bool?? = nil,
        glutenFree: Bool?? = nil,
        dairyFree: Bool?? = nil,
        veryHealthy: Bool?? = nil,
        cheap: Bool?? = nil,
        veryPopular: Bool?? = nil,
        sustainable: Bool?? = nil,
        lowFodmap: Bool?? = nil,
        weightWatcherSmartPoints: Int?? = nil,
        gaps: Gaps?? = nil,
        preparationMinutes: Int?? = nil,
        cookingMinutes: Int?? = nil,
        aggregateLikes: Int?? = nil,
        healthScore: Int?? = nil,
        creditsText: CreditsText?? = nil,
        license: License?? = nil,
        sourceName: SourceName?? = nil,
        pricePerServing: Double?? = nil,
        extendedIngredients: [ExtendedIngredientModel]?? = nil,
        id: Int,
        title: String?? = nil,
        readyInMinutes: Int?? = nil,
        servings: Int?? = nil,
        sourceURL: String?? = nil,
        image: String?? = nil,
        imageType: ImageType?? = nil,
        summary: String?? = nil,
        cuisines: [String]?? = nil,
        dishTypes: [String]?? = nil,
        diets: [String]?? = nil,
        occasions: [String]?? = nil,
        instructions: String?? = nil,
        analyzedInstructions: [AnalyzedInstructionModel]?? = nil,
        originalID: JSONNull?? = nil,
        spoonacularSourceURL: String?? = nil
    ) -> RecipeModel {
        return RecipeModel(
            vegetarian: vegetarian ?? self.vegetarian,
            vegan: vegan ?? self.vegan,
            glutenFree: glutenFree ?? self.glutenFree,
            dairyFree: dairyFree ?? self.dairyFree,
            veryHealthy: veryHealthy ?? self.veryHealthy,
            cheap: cheap ?? self.cheap,
            veryPopular: veryPopular ?? self.veryPopular,
            sustainable: sustainable ?? self.sustainable,
            lowFodmap: lowFodmap ?? self.lowFodmap,
            weightWatcherSmartPoints: weightWatcherSmartPoints ?? self.weightWatcherSmartPoints,
            gaps: gaps ?? self.gaps,
            preparationMinutes: preparationMinutes ?? self.preparationMinutes,
            cookingMinutes: cookingMinutes ?? self.cookingMinutes,
            aggregateLikes: aggregateLikes ?? self.aggregateLikes,
            healthScore: healthScore ?? self.healthScore,
            creditsText: creditsText ?? self.creditsText,
            license: license ?? self.license,
            sourceName: sourceName ?? self.sourceName,
            pricePerServing: pricePerServing ?? self.pricePerServing,
            extendedIngredients: extendedIngredients ?? self.extendedIngredients,
            id: id,
            title: title ?? self.title,
            readyInMinutes: readyInMinutes ?? self.readyInMinutes,
            servings: servings ?? self.servings,
            sourceURL: sourceURL ?? self.sourceURL,
            image: image ?? self.image,
            imageType: imageType ?? self.imageType,
            summary: summary ?? self.summary,
            cuisines: cuisines ?? self.cuisines,
            dishTypes: dishTypes ?? self.dishTypes,
            diets: diets ?? self.diets,
            occasions: occasions ?? self.occasions,
            instructions: instructions ?? self.instructions,
            analyzedInstructions: analyzedInstructions ?? self.analyzedInstructions,
            originalID: originalID ?? self.originalID,
            spoonacularSourceURL: spoonacularSourceURL ?? self.spoonacularSourceURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
