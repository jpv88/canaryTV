//
//  DetailInjection.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerDetailModule() {
        registerRouter()
        registerPresenter()
        registerViewController()
    }
        
    private func registerRouter() {
        injector.register(DetailRouter.self) { (r: ResolverInjection, view: BaseViewController) in
            DefaultDetailRouter(resolver: r, viewController: view)
        }
    }
    
    private func registerPresenter() {
        injector.register(DetailPresenter.self) { (r: ResolverInjection, data: MovieDetailInfoModel, view: DefaultDetailViewController) in
            let detailView = view as DetailViewController
            let baseVC = view as BaseViewController
            guard let router = r.resolve(DetailRouter.self, argument: baseVC) else {
                fatalError("Invalid args!")
            }
            guard let trailerMovieInteractor = r.resolve(GetMovieTrailerURLInteractor.self) else {
                fatalError("Invalid args!")
            }
            let presenter = DefaultDetailPresenter(
                view: detailView,
                router: router,
                dataModel: data,
                trailerMovieInteractor: trailerMovieInteractor
            )
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(DetailViewController.self) { (r: ResolverInjection, data: MovieDetailInfoModel) in
            let viewController = DefaultDetailViewController()
            let presenter = r.resolve(DetailPresenter.self, arguments: data, viewController)
            viewController.presenter = presenter
            return viewController
        }
    }
}
