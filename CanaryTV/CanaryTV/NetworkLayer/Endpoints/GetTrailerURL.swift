//
//  GetTrailerURL.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import Foundation
import Alamofire

struct GetTrailerURL: Requestable {
    
    var method: HTTPMethod = .post
    var path: String
    var parameters: [String : String]? = nil
    private let endpointPath = "me/streamings"
    
    init(movieID: String) {
        let baseURL = "\(Constants.API.host)/\(Constants.API.apiVersion)/\(endpointPath)"
        var urlComps = URLComponents(string: baseURL)
        
        let specificQueryItems: [URLQueryItem] = [
            URLQueryItem(name: "audio_language", value: "SPA"),
            URLQueryItem(name: "audio_quality", value: "2.0"),
            URLQueryItem(name: "content_id", value: movieID),
            URLQueryItem(name: "content_type", value: "movies"),
            URLQueryItem(name: "device_serial", value: "AABBCCDDCC112233"),
            URLQueryItem(name: "device_stream_video_quality", value: "FHD"),
            URLQueryItem(name: "player", value: "ios:PD-NONE"),
            URLQueryItem(name: "subtitle_language", value: "MIS"),
            URLQueryItem(name: "video_type", value: "trailer")
        ]
        
        urlComps?.queryItems = Constants.API.queryItems + specificQueryItems
        
        path = urlComps?.url?.absoluteString ?? ""
    }
}
