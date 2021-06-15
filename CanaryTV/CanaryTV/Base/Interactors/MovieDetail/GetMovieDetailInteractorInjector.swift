//
//  GetMovieDetailInteractorInjector.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerGetMovieDetailInfoInteractorInjector() {
        injector.register(GetMovieDetailInteractor.self) { r in
            GetMovieDetailInteractor(webService: r.resolve(WebService.self) ?? WebService())
        }
    }
}
