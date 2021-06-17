//
//  DefaultDetailPresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    
    private weak var view: DetailViewController?
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
        view?.showThisInfo(image: imageURL, title: title, description: description, rating: rating, year: year, duration: duration)
    }

    func showTrailer() {
        guard let id = dataModel.data?.id else { return }
        guard let trailers = dataModel.data?.viewOptions?.public?.trailers, let audioLanguages = trailers[0].audioLanguages, let languageID = audioLanguages[0].id, let subtitles = trailers[0].subtitleLanguages, let subtitleID = subtitles[0].id else { return }
        trailerMovieInteractor.execute(input: (id, languageID, subtitleID)) { [weak self] result in
            self?.playVideo(url: result)
        } errorHandler: { error in
            ErrorHandler.showError(error: error)
        }
    }
    
    private func playVideo(url: URL) {
        router.showTrailerScreen(with: url)
    }
    
}

