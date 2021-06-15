//
//  MovieDetailInfoModel.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

// MARK: - MovieDetailInfoModel
struct MovieDetailInfoModel: Codable {
    let data: DetailData?
}

// MARK: - DataClass
struct DetailData: Codable {
    let type, id: String?
    let numericalID: Int?
    let title, originalTitle: String?
    let year: Int?
    let shortPlot, plot: String?
    let duration: Int?
    let highlight: String?
    let durationInSeconds: Int?
    let ultravioletEnabled: Bool?
    let actors: [Actors]?
    let awards: [Award]?
    let classification: ClassificationFilm?
    let countries: [Country]?
    let directors: [Actors]?
    let genres: [Genre]?
    let images: ImagesData?
    let offlineEnabledForEst, offlineEnabledForRent, offlineEnabledForSvod: Bool?
    let orderOptions: [OrderOption]?
    let rating: Rating?
    let scores: [Score]?
    let tags: [Tags]?
    let viewOptions: ViewOptions?
    let labels: Labels?
}

// MARK: - Ctor
struct Actors: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let photo: String?
    let name: String?
}

// MARK: - Award
struct Award: Codable {
    let type, id: String?
    let numericalId: Int?
    let name, awardDescription: String?
    let year: Int?
    let category, result: String?
    let verdict: Verdict?
    let photo: String?
}

// MARK: - Verdict
struct Verdict: Codable {
    let name, localizedName: String?
}

// MARK: - Classification
struct ClassificationFilm: Codable {
    let type, id: String?
    let numericalId: Int?
    let name: String?
    let age: Int?
    let adult: Bool?
    let classificationDescription: String?
    let classificationDefault: Bool?
}

// MARK: - Country
struct Country: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let name, abbr: String?
    let image: String?
    let position: Int?
}

// MARK: - Tags
struct Tags: Codable {
    let type, id, name : String?
    let numericalId: Int?
}



// MARK: - Genre
struct Genre: Codable {
    let type, id: String?
    let numericalId: Int?
    let name: String?
    let adult, erotic, kids: Bool?
    let additionalImages: GenreAdditionalImages?
}

// MARK: - GenreAdditionalImages
struct GenreAdditionalImages: Codable {
    let icon: String?
}

// MARK: - Images
struct ImagesData: Codable {
    let artwork, snapshot: String?
    let ribbons: [Ribbon]?
}

// MARK: - OrderOption
struct OrderOption: Codable {
    let type, id: String?
    let numericalId: Int?
    let periodicPointsRewardAmount: Int?
    let price: String?
    let priceWithoutCurrency: Double?
    let points: Points?
    let purchaseType: PurchaseType?
    let videoQuality: Country?
    let externalTiers: [ExternalTier]?
    let warnings: [Warning]?
    let provider: Provider?
}

// MARK: - ExternalTier
struct ExternalTier: Codable {
    let type: String?
    let id: String?
    let price: String?
}

// MARK: - Points
struct Points: Codable {
    let cost, reward: Int?
}

// MARK: - Provider
struct Provider: Codable {
    let type, id: String?
    let numericalId: Int?
    let name: String?
    let pairingFlow, isMarketplace: Bool?
    let identifier: String?
}

// MARK: - Warning
struct Warning: Codable {
    let field, code, message: String?
}

// MARK: - Score
struct Score: Codable {
    let type, id: String?
    let numericalId: Int?
    let href: String?
    let amountOfVotes: Int?
    let formattedAmountOfVotes: String?
    let score: Double?
    let highlighted: Bool?
    let site: Site?
}

// MARK: - ViewOptions
struct ViewOptions: Codable {
    let support: Labels?
    let viewOptionsPublic: Public?
    let viewOptionsPrivate: Private?
}

// MARK: - Private
struct Private: Codable {
    let streams, offlineStreams: [OfflineStream]?
}

// MARK: - OfflineStream
struct OfflineStream: Codable {
    let hdrTypes: [AudioQuality]?
    let streamingDRMTypes: [StreamingDRMType]?
    let audioQualities: [AudioQuality]?
    let subtitleLanguages: [Language]?
    let videoQualities: [Country]?
    let audioLanguages: [Language]?
}

// MARK: - Language
struct Language: Codable {
    let type: String?
    let id: String?
    let numericalID: Int?
    let name, abbr: String?
}

// MARK: - StreamingDRMType
struct StreamingDRMType: Codable {
    let type, id: String?
}

// MARK: - Public
struct Public: Codable {
    let trailers: [OfflineStream]?
}
