//
//  DefaultHomeViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    var tableView: UITableView!
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildTableViewComponent()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutTableViewComponent()
    }
}

extension DefaultHomeViewController: HomeViewController {
    
    func showLoadedInfo() {
        
    }
        
}
