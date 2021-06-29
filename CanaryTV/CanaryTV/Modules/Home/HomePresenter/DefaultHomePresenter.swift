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
        getListMovies()
    }
    
    private func getListMovies() {
        async {
            do {
                await view?.showLoader()
                let listMovies = try await listMoviesInteractor.execute()
                view?.showLoadedInfo(input: listMovies)
                await view?.hideLoader()
            } catch  {
                view?.showThisError(error: error)
            }
        }
    }
    
    func someMoviePressed(movieID: String) {
        async {
            do {
                await view?.showLoader()
                let movieDetail = try await getMovieDetailInfoInteractor.execute(input: movieID)
                await view?.hideLoader()
                router.showDetailView(movieDetail: movieDetail)
            } catch {
                view?.showThisError(error: error)
            }
        }
    }
        
}
