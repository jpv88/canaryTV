//
//  HomeInjection.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerHomeModule() {
        registerRouter()
        registerPresenter()
        registerViewController()
    }
        
    private func registerRouter() {
        injector.register(HomeRouter.self) { r in            
            DefaultHomeRouter(resolver: r)
        }
    }
    
    private func registerPresenter() {
        injector.register(HomePresenter.self) { r in
            let presenter = DefaultHomePresenter()
            presenter.router = r.resolve(HomeRouter.self)
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(HomeViewController.self) { r in
            let viewController = DefaultHomeViewController()
            let tableManager = r.resolve(ListMoviesTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            viewController.presenter = r.resolve(HomePresenter.self)
            return viewController
        }
    }
}
