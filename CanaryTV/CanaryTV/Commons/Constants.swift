//
//  Constants.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation

struct Constants {
    struct API {
        static let host = "https://gizmo.rakuten.tv"
        static let apiVersion = "v3"
        static let queryItems = [
            URLQueryItem(name: "classification_id", value: "6"),
            URLQueryItem(name: "device_identifier", value: "ios"),
            URLQueryItem(name: "market_code", value: "es")
        ]
    }
}
