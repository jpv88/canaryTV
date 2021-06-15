//
//  Models.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation

// MARK: - ListMoviesModel
struct ListMoviesModel: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let type, id: String?
    let numericalId: Int?
    let category, shortName, contentType: String?
    let isB2B: Bool?
    let wktvCode: String?
    let onlyCoupon, isRecommendation: Bool?
    let name: String?
    let kind: String?
    let contents: Contents?
}

// MARK: - Contents
struct Contents: Codable {
    let data: [Datum]?
    let meta: Meta?
}

// MARK: - Datum
struct Datum: Codable{
    let type: String?
    let id: String?
    let numericalId: Int?
    let title: String?
    let year, duration: Int?
    let label: String?
    let classification: Classification?
    let images: Images?
    let highlightedScore: HighlightedScore?
    let rating: Rating?
    let labels: Labels?
}

// MARK: - Classification
struct Classification: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let name: String?
    let age: Int?
    let adult: Bool?
    let classificationDescription: String?
    let classificationDefault: Bool?
}

// MARK: - HighlightedScore
struct HighlightedScore: Codable {
    let score: Double?
    let amountOfVotes: Int?
    let formattedAmountOfVotes: String?
    let site: Site?
}

// MARK: - Site
struct Site: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let name: String?
    let showImage: Bool?
    let scale: Int?
    let image: String?
}

// MARK: - Images
struct Images: Codable {
    let artwork, snapshot: String?
    let mobileSpotlight: String?
    let ribbons: [Ribbon]?
}

// MARK: - Ribbon
struct Ribbon: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let name: String?
    let color: String?
    let textColor: String?
    let position: String?
    let localizedName: String?
    let image: String?
}

// MARK: - Labels
struct Labels: Codable {
    let audioQualities, hdrTypes: [AudioQuality]?
    let purchaseTypes: [PurchaseType]?
    let videoQualities: [AudioQuality]?
}

// MARK: - AudioQuality
struct AudioQuality: Codable {
    let type: String?
    let id: String?
    let numericalId: Int?
    let name: String?
    let abbr: String?
    let image: String?
    let position: Int?
}

// MARK: - PurchaseType
struct PurchaseType: Codable {
    let type, id: String?
    let numericalId: Int?
    let isRecurring: Bool?
    let name, label, kind: String?
    let expiresAfterInSeconds, availableTimeInSeconds: Int?
}

// MARK: - Rating
struct Rating: Codable {
    let average, scale: Int?
}

// MARK: - Meta
struct Meta: Codable {
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let page, count, perPage, offset: Int?
    let totalPages: Int?
}

