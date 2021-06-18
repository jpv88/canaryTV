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

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}

class WebService {
    
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .deferredToDate
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func loadFromWebService<T>(type: T.Type, endpoint: Endpoint, completionHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void) where T: Decodable {
        
        let vc = UIApplication.topViewController()
        vc?.showLoader()
        
        let myRequest = endpoint.getRequest

        AF.request(myRequest.path, method: myRequest.method, parameters: myRequest.parameters, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON { [weak self] response in

            vc?.hideLoader()            
            
            switch response.result {
            case .success( _):
                do {
                    if let data = response.data, let object = try? self?.decoder.decode(T.self, from: data) {
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
