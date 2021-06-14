//
//  ListMoviesTableManager.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

protocol ListMoviesActions {
    func someMoviePressed()
}

class ListMoviesTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: [FreeListMoviesModel]?
    var delegate: ListMoviesActions?
    
    func set(input: [FreeListMoviesModel]) {
        dataSource = input
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
