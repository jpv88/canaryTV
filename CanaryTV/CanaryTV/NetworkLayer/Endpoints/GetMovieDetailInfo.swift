//
//  GetMovieDetailInfo.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct GetMovieDetailInfo: Requestable {
    
    var method: HTTPMethod = .post
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "movies/"
    
    init(movieID: String) {
        let baseURL = "\(Constants.API.host)/\(Constants.API.apiVersion)/\(endpointPath)/\(movieID)"
        var urlComps = URLComponents(string: baseURL)
        urlComps?.queryItems = Constants.API.queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
}
