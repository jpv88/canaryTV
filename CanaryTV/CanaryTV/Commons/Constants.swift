//
//  Constants.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct Constants {
    struct API {
        static let host = "https://gizmo.rakuten.tv/"
        static let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        static let apiVersion = "v3"
    }
}
