//
//  DefaultHomePresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomePresenter: HomePresenter {
    
    private weak var view: HomeViewController?
    private let router: HomeRouter
    private let listMoviesInteractor: ListMoviesInteractor
    private let getMovieDetailInfoInteractor: GetMovieDetailInteractor
    
    init(view: HomeViewController, router: HomeRouter, listMoviesInteractor: ListMoviesInteractor, getMovieDetailInfoInteractor: GetMovieDetailInteractor) {
        self.view = view
        self.router = router
        self.listMoviesInteractor = listMoviesInteractor
        self.getMovieDetailInfoInteractor = getMovieDetailInfoInteractor
    }
    
    func onViewDidLoad() {
        listMoviesInteractor.execute { [weak self] result in
            self?.view?.showLoadedInfo(input: result)
        } errorHandler: { [weak self] error in
            self?.view?.showThisError(error: error)
        }
    }
    
    func someMoviePressed(movieID: String) {
        getMovieDetailInfoInteractor.execute(input: movieID) { [weak self] result in
            self?.router.showDetailView(movieDetail: result)
        } errorHandler: { [weak self] error in
            self?.view?.showThisError(error: error)
        }

    }
        
}
