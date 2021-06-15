//
//  DefaultHomeViewController+BuildComponents.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

internal extension DefaultHomeViewController {
    
    func buildView() {
        title = Constant.title
    }
    
    func buildTableViewComponent() {
        let component = UITableView()
        component.backgroundColor = .clear
        component.bounces = false
        component.separatorStyle = .none
        component.delegate = tableManager
        component.dataSource = tableManager
        component.register(UINib(nibName: ListMoviesTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: ListMoviesTableViewCell.getIdentifier())
        tableView = component
    }
    
}
