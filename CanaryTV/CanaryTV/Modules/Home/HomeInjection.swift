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
            guard let view = r.resolve(HomeViewController.self) else {
                fatalError("Invalid args!")
            }
            guard var router = r.resolve(HomeRouter.self) else {
                fatalError("Invalid args!")
            }
            router.viewController = view as? BaseViewController
            guard let listMoviesInteractor = r.resolve(ListMoviesInteractor.self) else {
                fatalError("Invalid args!")
            }
            guard let getMovieDetailInfoInteractor = r.resolve(GetMovieDetailInteractor.self) else {
                fatalError("Invalid args!")
            }
            let presenter = DefaultHomePresenter(
                view: view,
                router: router,
                listMoviesInteractor: listMoviesInteractor,
                getMovieDetailInfoInteractor: getMovieDetailInfoInteractor
            )
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(HomeViewController.self) { r in
            let viewController = DefaultHomeViewController()
            let tableManager = r.resolve(ListMoviesTableManager.self)
            tableManager?.delegate = viewController
            viewController.tableManager = tableManager
            return viewController
        }
        .initCompleted { r, homeViewController in
            guard let vc = homeViewController as? DefaultHomeViewController else { return }
            vc.presenter = r.resolve(HomePresenter.self)
        }
    }
}
