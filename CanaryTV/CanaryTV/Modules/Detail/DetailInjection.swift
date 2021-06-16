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
        injector.register(DetailRouter.self) { r in
            DefaultDetailRouter(resolver: r)
        }
    }
    
    private func registerPresenter() {
        injector.register(DetailPresenter.self) { (r: ResolverInjection, data: MovieDetailInfoModel, view: DetailViewController) in
            let presenter = DefaultDetailPresenter(
                view: view,
                router: r.resolve(DetailRouter.self)!,
                dataModel: data
            )
            return presenter
        }
    }
    
    private func registerViewController() {
        injector.register(DetailViewController.self) { (r: ResolverInjection, data: MovieDetailInfoModel) in
            let viewController = DefaultDetailViewController()
            let detailView = viewController as DetailViewController
            let presenter = r.resolve(DetailPresenter.self, arguments: data, detailView)
            viewController.presenter = presenter
            return viewController
        }
    }
}
