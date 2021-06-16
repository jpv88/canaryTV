//
//  DefaultHomeRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomeRouter: HomeRouter {
    
    weak var viewController: BaseViewController?
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection) {
        self.resolver = resolver
    }
    
    func showDetailView(movieDetail: MovieDetailInfoModel) {
        guard let detailViewController = resolver.resolve(DetailViewController.self, argument: movieDetail) as? DefaultDetailViewController else { return }
        guard let from = viewController else { return }
        from.navigationController?.pushViewController(detailViewController, animated: true)        
    }
    
}
