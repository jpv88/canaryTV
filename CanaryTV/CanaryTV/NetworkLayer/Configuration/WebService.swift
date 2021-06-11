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
}

class WebService {
    
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .deferredToDate
    }
    
    func loadFromWebService<T>(type: T.Type, endpoint: Endpoint, completionHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void) where T: Decodable {
        
        let vc = UIApplication.topViewController()
        vc?.showLoader()
        
        let myRequest = endpoint.getRequest

        AF.request(myRequest.path, method: myRequest.method, parameters: myRequest.parameters, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON { response in

            vc?.hideLoader()            
            
            switch response.result {
            case .success( _):
                do {
                    if let data = response.data, let object = try? self.decoder.decode(T.self, from: data) {
                        completionHandler(object)
                    } else {
                        throw MyCustomError.NoParsedModel("Model could not be parsed")
                    }
                }
                catch {
                    errorHandler(error)
                }
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
  
}
