//
//  GetMovieDetailInteractor.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

class GetMovieDetailInteractor: InOutInteractor<GetMovieDetailInteractor.Input, GetMovieDetailInteractor.Output> {
    
    typealias Input = String
    typealias Output = MovieDetailInfoModel
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
//    func exe(input: Input) async -> Output {
//                
//    
//        
//        
//    }
    
    override func execute(input: Input, completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        webService.loadFromWebService(type: MovieDetailInfoModel.self, endpoint: .Movie(movieID: input)) { result in
            completion(result)
        } errorHandler: { error in
            errorHandler(error)
        }

    }
    
}
