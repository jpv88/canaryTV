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
        injector.register(HomeRouter.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultHomeRouter(resolver: r, viewController: view)
        }
    }
    
    private func registerPresenter() {
        injector.register(HomePresenter.self) { (r: ResolverInjection, view: DefaultHomeViewController) in
            let homeView = view as HomeViewController
            let baseVC = view as BaseViewController
            guard let router = r.resolve(HomeRouter.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let listMoviesInteractor = r.resolve(ListMoviesInteractor.self) else {
                fatalError("Invalid args!")
            }
            guard let getMovieDetailInfoInteractor = r.resolve(GetMovieDetailInteractor.self) else {
                fatalError("Invalid args!")
            }
            let presenter = DefaultHomePresenter(
                view: homeView,
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
            let presenter = r.resolve(HomePresenter.self, argument: viewController)
            viewController.presenter = presenter
            return viewController
        }
    }
    
}
