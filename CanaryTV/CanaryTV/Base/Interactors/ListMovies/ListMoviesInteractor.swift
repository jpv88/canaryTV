//
//  ListMoviesInteractor.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class ListMoviesInteractor: OutputInteractor<ListMoviesInteractor.Output> {
    
    typealias Output = [ListMoviesModel]
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute() async throws -> Output {
        
        var moviesList: [ListMoviesModel] = []
        
        do {
            let freeMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .FreeMovies)
            let lastMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .LastMovies)
            let storiesMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .StoriesMovies)
            let actionMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .ActionMovies)
            let cinemaMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .CinemaMovies)
            let comedyMovies = try await webService.load(type: ListMoviesModel.self, endpoint: .ComedyMovies)
            moviesList = [
                freeMovies,
                lastMovies,
                storiesMovies,
                actionMovies,
                cinemaMovies,
                comedyMovies
            ]
            return moviesList
        } catch {
            throw MyCustomError.ApiError("Api Error")
        }        

    }
    
}
