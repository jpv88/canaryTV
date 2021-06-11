//
//  ListMovies.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct ListMovies: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "lists/estrenos-imprescindibles-en-taquilla"
    
    init() {
        let queryItems = [
            URLQueryItem(name: "classification_id", value: "6"),
            URLQueryItem(name: "device_identifier", value: "ios"),
            URLQueryItem(name: "market_code", value: "es")
        ]
        let baseURL = "\(Constants.API.host)/\(Constants.API.apiVersion)/\(endpointPath)"
        var urlComps = URLComponents(string: baseURL)
        urlComps?.queryItems = queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
    
    
}
