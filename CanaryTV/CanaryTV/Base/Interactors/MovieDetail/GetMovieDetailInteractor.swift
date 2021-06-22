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
    
    override func execute(input: Input) async throws -> Output {        
        do {
            let object = try await webService.load(type: MovieDetailInfoModel.self, endpoint: .Movie(movieID: input))
            return object
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }
    }
    
}
