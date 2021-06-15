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
    
    override func execute(completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        var moviesList: [ListMoviesModel] = []
        let group = DispatchGroup()
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .FreeMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .LastMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .StoriesMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .ActionMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .CinemaMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }
        
        group.enter()
        webService.loadFromWebService(type: ListMoviesModel.self, endpoint: .ComedyMovies) { result in
            moviesList.append(result)
            group.leave()
        } errorHandler: { error in
            group.leave()
        }

        group.notify(queue: .main) {
            // All requests completed
            if moviesList.isEmpty {
                errorHandler(MyCustomError.ApiError("Something is wrong in backend"))
            } else {
                completion(moviesList)
            }
        }

    }
    
}
