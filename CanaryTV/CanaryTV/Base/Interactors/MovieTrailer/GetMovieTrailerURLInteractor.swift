//
//  GetMovieTrailerURLInteractor.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

class GetMovieTrailerURLInteractor: InOutInteractor<GetMovieTrailerURLInteractor.Input, GetMovieTrailerURLInteractor.Output> {
    
    typealias Input = (movieID: String, languageID: String, subtitleID: String)
    typealias Output = URL
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute(input: Input) async throws -> Output {
        
        do {
            let object = try await webService.load(type: MovieTrailerModel.self, endpoint: .Trailer(movieID: input.movieID, languageID: input.languageID, subtitleID: input.subtitleID))
            guard let streamInfo = object.data?.streamInfos, let urlParam = streamInfo[0].url, let url = URL(string: urlParam) else {
                throw MyCustomError.NoParsedModel("Couldnt get url")
            }
            return url
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }

    }
    
}
