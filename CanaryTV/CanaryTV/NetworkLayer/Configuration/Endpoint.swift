//
//  Endpoint.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

enum Endpoint {
    case FreeMovies
    case LastMovies
    case StoriesMovies
    case ActionMovies
    case CinemaMovies
    case ComedyMovies
    case Movie(movieID: String)
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
        case .FreeMovies:
            return ListFreeMovies()
        case .LastMovies:
            return ListLastMovies()
        case .StoriesMovies:
            return ListStoriesMovies()
        case .ActionMovies:
            return ListActionMovies()
        case .CinemaMovies:
            return ListCinemaMovies()
        case .ComedyMovies:
            return ListComedyMovies()
        case .Movie(movieID: let id):
            return GetMovieDetailInfo(movieID: id)
        case .Trailer:
            return GetTrailerURL()
        }
    }
}
