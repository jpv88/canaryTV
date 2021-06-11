//
//  GetMovieInfo.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct GetMovieInfo: Requestable {
    
    var method: HTTPMethod = .post
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "lists/estrenos-imprescindibles-en-taquilla"
    
    init(title: String) {
        path = ""
    }
}
