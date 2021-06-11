//
//  GetTrailerURL.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct GetTrailerURL: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "lists/estrenos-imprescindibles-en-taquilla"
    
    init() {
        path = ""
    }
}
