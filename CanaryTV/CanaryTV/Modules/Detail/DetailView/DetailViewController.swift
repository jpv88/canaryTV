//
//  DetailViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import UIKit

@objc protocol DetailViewController where Self: UIViewController {
    func showThisInfo(image: URL, title: String, description: String, rating: String, year: String, duration: String)
}
