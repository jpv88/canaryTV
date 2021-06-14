//
//  RegisterUtils.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerUtils() {
        registerWebService()
        registerListMoviesTableManager()
    }
    
    private func registerWebService() {
        injector.register(WebService.self) { _ in
            WebService()
        }
    }
    
    private func registerListMoviesTableManager() {
        injector.register(ListMoviesTableManager.self) { _ in
            ListMoviesTableManager()
        }
    }
}
