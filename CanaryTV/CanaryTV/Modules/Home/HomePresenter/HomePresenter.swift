//
//  HomePresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

protocol HomePresenter {
    func onViewDidLoad() async
    func someMoviePressed(movieID: String) async
}
