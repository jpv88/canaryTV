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
        static let accessibilityIdentifier = "HomeView"
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
    
    func showThisError(error: Error) {
        showError(error: error)
    }
    
    
    func showLoadedInfo(input: [ListMoviesModel]) {
        tableManager?.set(input: input)
    }
        
}

extension DefaultHomeViewController: ListMoviesActions {
    
    func someMoviePressed(movieID: String) {
        presenter?.someMoviePressed(movieID: movieID)
    }
    
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
