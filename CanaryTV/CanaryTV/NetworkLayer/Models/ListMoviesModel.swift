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
    let numericalID: Int?
    let category, shortName, contentType: String?
    let isB2B: Bool?
    let wktvCode: String?
    let onlyCoupon, isRecommendation: Bool?
    let name, kind: String?
    let contents: Contents?
}

// MARK: - Contents
struct Contents: Codable {
    let data: [DataContent]?
    let meta: Meta?
}

// MARK: - Datum
struct DataContent: Codable {
    let type: String?
    let id: String?
    let numericalID: Int?
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
    let numericalID: Int?
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
    let numericalID: Int?
    let name: String?
    let showImage: Bool?
    let scale: Int?
    let image: String?
}

// MARK: - Images
struct Images: Codable {
    let artwork, snapshot: String?
}

// MARK: - Labels
struct Labels: Codable {
    let audioQualities, hdrTypes: [Quality]?
    let purchaseTypes: [PurchaseType]?
    let videoQualities: [Quality]?
}

// MARK: - AudioQuality
struct Quality: Codable {
    let type: String?
    let id: String?
    let numericalID: Int?
    let name: String?
    let abbr: String?
    let image: String?
    let position: Int?
}

// MARK: - PurchaseType
struct PurchaseType: Codable {
    let type: String?
    let id: String?
    let numericalID: Int?
    let isRecurring: Bool?
    let name: String?
    let label: String?
    let kind: String?
    let expiresAfterInSeconds, availableTimeInSeconds: String?
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
