//
//  Endpoint.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation


struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    static let connect = HTTPMethod(rawValue: "CONNECT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    static let get = HTTPMethod(rawValue: "GET")
    static let head = HTTPMethod(rawValue: "HEAD")
    static let options = HTTPMethod(rawValue: "OPTIONS")
    static let patch = HTTPMethod(rawValue: "PATCH")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let trace = HTTPMethod(rawValue: "TRACE")

    let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

enum Endpoint {
    case FreeMovies
    case LastMovies
    case StoriesMovies
    case ActionMovies
    case CinemaMovies
    case ComedyMovies
    case Movie(movieID: String)
    case Trailer(movieID: String, languageID: String, subtitleID: String)
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
        case .Trailer(movieID: let id, languageID: let languageID, let subtitleID):
            return GetTrailerURL(movieID: id, languageID: languageID, subtitleID: subtitleID)
        }
    }
}
