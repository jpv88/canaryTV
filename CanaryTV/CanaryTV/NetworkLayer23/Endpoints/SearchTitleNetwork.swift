//
//  SearchTitleNetwork.swift
//  sdos
//
//  Created by Jared Perez Vega on 21/12/2019.
//  Copyright © 2019 Jared Perez Vega. All rights reserved.
//

import Foundation
import Alamofire

struct SearchTitleNetwork: Requestable {
    
    var method: HTTPMethod = .get
    var path: String
    var parameters: [String : String]? = nil
    
    init(title: String) {
        let formatedTitle = title.lowercased().replacingOccurrences(of: " ", with: "+")
        let queryItems = [URLQueryItem(name: "t", value: formatedTitle), URLQueryItem(name: "apikey", value: Constant.Base.apiKey)]
        let urlComps = NSURLComponents(string: Constant.Base.url)
        urlComps?.queryItems = queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
    
}
