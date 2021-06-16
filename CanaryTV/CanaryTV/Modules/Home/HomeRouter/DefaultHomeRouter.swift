//
//  DefaultHomeRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomeRouter: HomeRouter {
    
    var viewController: BaseViewController
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection, viewController: BaseViewController) {
        self.resolver = resolver
        self.viewController = viewController
    }
    
    func showDetailView(movieDetail: MovieDetailInfoModel) {
        guard let detailViewController = resolver.resolve(DetailViewController.self, argument: movieDetail) as? DefaultDetailViewController else { return }
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
