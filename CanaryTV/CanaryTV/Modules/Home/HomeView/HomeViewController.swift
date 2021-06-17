//
//  HomeViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

protocol HomeViewController where Self: UIViewController {
    func showLoadedInfo(input: [ListMoviesModel])
}
