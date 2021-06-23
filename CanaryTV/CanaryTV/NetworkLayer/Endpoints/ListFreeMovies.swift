//
//  ListMovies.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation

struct ListFreeMovies: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "lists/free-la-mejor-seleccion-de-peliculas"
    
    init() {
        let baseURL = "\(Constants.API.host)/\(Constants.API.apiVersion)/\(endpointPath)"
        var urlComps = URLComponents(string: baseURL)
        urlComps?.queryItems = Constants.API.queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
    
    
}
