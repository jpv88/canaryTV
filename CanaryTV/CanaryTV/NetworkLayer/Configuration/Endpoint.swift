//
//  Endpoint.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

enum Endpoint {
    case List
    case Movie(title: String)
    case Trailer
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var getRequest: Requestable {
        switch self {
        case .List:
            return ListMovies()
        case .Movie(title: let title):
            return GetMovieInfo(title: title)
        case .Trailer:
            return GetTrailerURL()
        }
    }
}
