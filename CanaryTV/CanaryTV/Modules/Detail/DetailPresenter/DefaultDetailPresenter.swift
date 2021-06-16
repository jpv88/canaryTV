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
    
    init(view: DetailViewController, router: DetailRouter, dataModel: MovieDetailInfoModel) {
        self.view = view
        self.router = router
        self.dataModel = dataModel
    }
    
    func onViewDidLoad() {
        guard let image = dataModel.data?.images?.artwork, let imageURL = URL(string: image) else { return }
        let title = dataModel.data?.originalTitle ?? ""
        let description = dataModel.data?.plot ?? ""
    
        view.showThisInfo(image: imageURL, title: title, description: description)
    }
    
}
