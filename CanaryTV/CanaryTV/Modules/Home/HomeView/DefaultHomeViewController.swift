//
//  DefaultHomeViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    internal var tableView: UITableView!
    var presenter: HomePresenter?
    var tableManager: ListMoviesTableManager?
    
    internal enum Constant {
        static let title = "Canary TV"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildView()
        buildTableViewComponent()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutTableViewComponent()
    }
}

extension DefaultHomeViewController: HomeViewController {
    
    func showLoadedInfo(input: [ListMoviesModel]) {
        tableManager?.set(input: input)
    }
        
}

extension DefaultHomeViewController: ListMoviesActions {
    
    func someMoviePressed(movie: Datum) {
        presenter?.someMoviePressed(movie: movie)
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    
}
