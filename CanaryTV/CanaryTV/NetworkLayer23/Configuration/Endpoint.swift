//
//  Endpoint.swift
//  sdos
//
//  Created by Jared Perez Vega on 21/12/2019.
//  Copyright © 2019 Jared Perez Vega. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    case byTitle(title: String)
}

protocol Requestable {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var getRequest: Requestable {
        switch self {
        case .byTitle(let title):
            return SearchTitleNetwork(title: title)        
        }
    }
}
