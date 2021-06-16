//
//  GetMovieTrailerURLInteractorInjector.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerGetMovieTrailerURLInteractorInjector() {
        injector.register(GetMovieTrailerURLInteractor.self) { r in
            GetMovieTrailerURLInteractor(webService: r.resolve(WebService.self) ?? WebService())
        }
    }
}
