//
//  HomeRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

protocol RouterBase {
    var viewController: BaseViewController? { get set }
}

protocol HomeRouter: RouterBase {
    func showDetailView(movieDetail: MovieDetailInfoModel)
}
