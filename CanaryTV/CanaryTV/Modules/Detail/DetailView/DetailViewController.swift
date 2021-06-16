//
//  DetailViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

protocol DetailViewController {
    func showThisInfo(image: URL, title: String, description: String, rating: String, year: String, duration: String)
}
