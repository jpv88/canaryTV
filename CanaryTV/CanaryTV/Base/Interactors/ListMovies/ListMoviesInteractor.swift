//
//  ListMoviesInteractor.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class ListMoviesInteractor: OutputInteractor<ListMoviesInteractor.Output> {
    
    typealias Output = [FreeListMoviesModel]
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
        super.init()
    }
    
    override func execute(completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        webService.loadFromWebService(type: FreeListMoviesModel.self, endpoint: .List) { result in
            completion([result])
        } errorHandler: { error in
            errorHandler(error)
        }

    }
    
}
