//
//  MovieDetailInfoModel.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

// MARK: - MovieDetailInfoModel
struct MovieDetailInfoModel: Codable {
    let data: DetailClass?
}

// MARK: - DataClass
struct DetailClass: Codable {
    let originalTitle: String?
    let durationInSeconds: Int?
    let offlineEnabledForEst: Bool?
    let id: String?
    let countries: [Country]?
    let offlineEnabledForSvod: Bool?
    let genres: [Genre]?
    let duration: Int?
    let year: Int?
    let labels: DetailLabels?
    let type: String?
    let classification: DetailClassification?
    let ultravioletEnabled: Bool?
    let orderOptions: [OrderOption]?
    let viewOptions: ViewOptions?
    let plot: String?
    let images: DetailImages?
    let actors, directors: [Ctor]?
    let tags: [Tags]?
    let offlineEnabledForRent: Bool?
    let scores: [Score]?
    let shortPlot: String?
    let title: String?
    let numericalID: Int?
    let rating: DetailRating?
}

struct Tags: Codable {
    let id: String?
    let name: String?
    let numericalId: Int?
    let type: String?
}

// MARK: - Ctor
struct Ctor: Codable {
    let numericalID: Int?
    let id: String?
    let type: String?
    let photo: String?
    let name: String?
}

// MARK: - Classification
struct DetailClassification: Codable {
    let id: String?
    let age: Int?
    let adult: Bool?
    let numericalID: Int?
    let type, classificationDescription, name: String?
    let classificationDefault: Bool?
}

// MARK: - Country
struct Country: Codable {
    let numericalID: Int?
    let id: String?
    let type: String?
    let name, abbr: String?
    let image: String?
    let position: Int?
}

// MARK: - Genre
struct Genre: Codable {
    let erotic: Bool?
    let additionalImages: AdditionalImages?
    let id: String?
    let adult, kids: Bool?
    let numericalID: Int?
    let type, name: String?
}

// MARK: - AdditionalImages
struct AdditionalImages: Codable {
    let icon: String?
}

// MARK: - Images
struct DetailImages: Codable {
    let artwork: String?
    let ribbons: [Ribbon]?
    let snapshot: String?
}

// MARK: - Labels
struct DetailLabels: Codable {
    let videoQualities: [Country]?
    let audioQualities, hdrTypes: [AudioQuality]?
    let purchaseTypes: [PurchaseType]?
}

// MARK: - OrderOption
struct OrderOption: Codable {
    let id: String?
    let numericalID: Int?
    let points: Points?
    let purchaseType: PurchaseType?
    let provider: Provider?
    let type: String?
    let periodicPointsRewardAmount: Int?
    let price: String?
    let priceWithoutCurrency: Double?
    let videoQuality: Country?
    let externalTiers: [ExternalTier]?
    let warnings: [Warning]?
}

// MARK: - ExternalTier
struct ExternalTier: Codable {
    let type, id, price: String?
}

// MARK: - Points
struct Points: Codable {
    let reward, cost: Int?
}

// MARK: - Provider
struct Provider: Codable {
    let id: String?
    let numericalID: Int?
    let type: String?
    let isMarketplace: Bool?
    let name: String?
    let pairingFlow: Bool?
}

// MARK: - Warning
struct Warning: Codable {
    let field, message, code: String?
}

// MARK: - Rating
struct DetailRating: Codable {
    let average, scale: Int?
}

// MARK: - Score
struct Score: Codable {
    let site: Site?
    let formattedAmountOfVotes: String?
    let score: Double?
    let id: String?
    let highlighted: Bool?
    let amountOfVotes: Int?
    let href: String?
    let numericalID: Int?
    let type: String?
}

// MARK: - ViewOptions
struct ViewOptions: Codable {
    let support: Labels?
    let `public`: Public?
    let `private`: Private?
}

// MARK: - Private
struct Private: Codable {
    let streams, offlineStreams: [OfflineStream]?
}

// MARK: - OfflineStream
struct OfflineStream: Codable {
    let subtitleLanguages: [Language]?
    let videoQualities: [Country]?
    let audioLanguages: [Language]?
    let hdrTypes: [AudioQuality]?
    let streamingDRMTypes: [StreamingDRMType]?
    let audioQualities: [AudioQuality]?
}

// MARK: - Language
struct Language: Codable {
    let numericalID: Int?
    let id: String?
    let type: String?
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
