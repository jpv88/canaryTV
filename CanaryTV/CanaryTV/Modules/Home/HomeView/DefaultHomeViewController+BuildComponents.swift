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
        tableView = component
    }
    
}
