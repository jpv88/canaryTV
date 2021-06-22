//
//  WebService.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import UIKit
import Alamofire

enum MyCustomError: Error {
    case NoParsedModel(String)
    case ApiError(String)
}

class WebService: NSObject, URLSessionTaskDelegate {
    
    private let decoder = JSONDecoder()
    
    override init() {
        decoder.dateDecodingStrategy = .deferredToDate
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
        
    func load<T>(type: T.Type, endpoint: Endpoint) async throws -> T where T: Decodable {
        
        let myRequest = endpoint.getRequest
        
        let urlRequest = try URLRequest(url: myRequest.path, method: myRequest.method, headers: Constants.API.headers)
        let aux = try await URLSession.shared.data(for: urlRequest, delegate: self)
        guard let httpResponse = aux.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MyCustomError.ApiError("API is down")
        }
        let data = aux.0
        guard let object = try? decoder.decode(T.self, from: data) else {
            throw MyCustomError.NoParsedModel("Model could not be parsed")
        }
        
        return object
    }
    
//    func loadFromWebService<T>(type: T.Type, endpoint: Endpoint, completionHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void) where T: Decodable {
//        
//        let vc = UIApplication.topViewController()
//        vc?.showLoader()
//        
//        let myRequest = endpoint.getRequest
//
//        AF.request(myRequest.path, method: myRequest.method, parameters: myRequest.parameters, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON { [weak self] response in
//
//            vc?.hideLoader()            
//            
//            switch response.result {
//            case .success( _):
//                do {
//                    if let data = response.data, let object = try? self?.decoder.decode(T.self, from: data) {
//                        completionHandler(object)
//                    } else {
//                        throw MyCustomError.NoParsedModel("Model could not be parsed")
//                    }
//                }
//                catch {
//                    errorHandler(error)
//                }
//            case .failure(let error):
//                errorHandler(error)
//            }
//        }
//    }
  
}
