//
//  GetMovieTrailerURLInteractor.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

class GetMovieTrailerURLInteractor: InOutInteractor<GetMovieTrailerURLInteractor.Input, GetMovieTrailerURLInteractor.Output> {
    
    typealias Input = String
    typealias Output = URL
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute(input: Input, completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        webService.loadFromWebService(type: MovieTrailerModel.self, endpoint: .Trailer(movieID: input)) { result in
            guard let streamInfo = result.data?.streamInfos, let urlParam = streamInfo[0].url, let url = URL(string: urlParam) else {
                errorHandler(MyCustomError.ApiError("Some is wrong"))
                return
            }
            completion(url)
        } errorHandler: { error in
            errorHandler(error)
        }

    }
    
}
