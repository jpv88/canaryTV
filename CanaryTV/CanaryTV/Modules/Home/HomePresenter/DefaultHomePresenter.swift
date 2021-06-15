//
//  DefaultHomePresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomePresenter: HomePresenter {
    
    private var view: HomeViewController
    private let router: HomeRouter
    private let listMoviesInteractor: ListMoviesInteractor
    
    init(view: HomeViewController, router: HomeRouter, listMoviesInteractor: ListMoviesInteractor) {
        self.view = view
        self.router = router
        self.listMoviesInteractor = listMoviesInteractor
    }
    
    func onViewDidLoad() {
        listMoviesInteractor.execute { result in
            self.view.showLoadedInfo(input: result)
        } errorHandler: { error in
            ErrorHandler.showError(error: error)
        }

    }
        
}
