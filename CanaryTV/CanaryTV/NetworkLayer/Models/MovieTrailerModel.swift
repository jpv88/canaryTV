//
//  MovieTrailerModel.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

// MARK: - MovieTrailerModel
struct MovieTrailerModel: Codable {
    let data: TrailerDataClass?
}

// MARK: - DataClass
struct TrailerDataClass: Codable {
    let id: String?
    let streamInfos: [StreamInfo]?
    let type: String?
}

// MARK: - StreamInfo
struct StreamInfo: Codable {
    let player, displayAspectRatio, activeAspectRatio, cdn: String?
    let mediaKey: String?
    let url: String?
    let videoQuality, wrid, formatKey: String?
}
