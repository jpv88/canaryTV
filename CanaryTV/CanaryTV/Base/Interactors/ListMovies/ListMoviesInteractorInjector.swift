//
//  ListMoviesInteractorInjector.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerListMoviesInteractorInjector() {
        injector.register(ListMoviesInteractor.self) { r in
            ListMoviesInteractor(webService: r.resolve(WebService.self) ?? WebService())
        }
    }
}
