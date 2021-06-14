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
    
    override func execute() throws -> Output {
        let result: [FreeListMoviesModel] = []
        return result
    }
}
