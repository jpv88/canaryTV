//
//  ListCinemaMovies.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

struct ListCinemaMovies: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "lists/cinema-2010-2020-una-decada-de-cine-compra-desde-3-99"
    
    init() {
        let baseURL = "\(Constants.API.host)/\(Constants.API.apiVersion)/\(endpointPath)"
        var urlComps = URLComponents(string: baseURL)
        urlComps?.queryItems = Constants.API.queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
    
}
