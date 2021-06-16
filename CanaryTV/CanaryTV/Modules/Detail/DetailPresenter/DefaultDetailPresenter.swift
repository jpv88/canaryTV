//
//  DefaultDetailPresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    
    private var view: DetailViewController
    private let router: DetailRouter
    private var dataModel: MovieDetailInfoModel
    private let trailerMovieInteractor: GetMovieTrailerURLInteractor
    
    init(view: DetailViewController, router: DetailRouter, dataModel: MovieDetailInfoModel, trailerMovieInteractor: GetMovieTrailerURLInteractor) {
        self.view = view
        self.router = router
        self.dataModel = dataModel
        self.trailerMovieInteractor = trailerMovieInteractor
    }
    
    func onViewDidLoad() {
        guard let image = dataModel.data?.images?.artwork, let imageURL = URL(string: image) else { return }
        let title = dataModel.data?.originalTitle ?? ""
        let description = dataModel.data?.plot ?? ""
        let rating = "★ \(dataModel.data?.rating?.average?.description ?? "")"
        let year = dataModel.data?.year?.description ?? ""
        let duration = "\(dataModel.data?.duration?.description ?? "")m"
        view.showThisInfo(image: imageURL, title: title, description: description, rating: rating, year: year, duration: duration)
    }

    func showTrailer() {
        guard let id = dataModel.data?.id else { return }
        trailerMovieInteractor.execute(input: id) { result in
            self.playVideo(url: result)
        } errorHandler: { error in
            ErrorHandler.showError(error: error)
        }
    }
    
    private func playVideo(url: URL) {
        let player = Player(url: url)
        let vc = PlayerViewController()
        vc.player = player
        router.showTrailerScreen(with: vc)
    }
    
}

