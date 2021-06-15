//
//  ListMoviesTableManager.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

protocol ListMoviesActions {
    func someMoviePressed(movie: Datum)
    func updateUI()
}

class ListMoviesTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var dataSource: [ListMoviesModel]?
    var delegate: ListMoviesActions?
    
    func set(input: [ListMoviesModel]) {
        dataSource = input
        delegate?.updateUI()
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListMoviesTableViewCell.getIdentifier(), for: indexPath) as? ListMoviesTableViewCell else {
            return UITableViewCell()
        }
        guard let dataSource = dataSource else {
            return UITableViewCell()
        }
        guard let name = dataSource[indexPath.row].data?.name, let data = dataSource[indexPath.row].data?.contents?.data else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.fill(title: name, model: data)
        return cell
    }
    
}

extension ListMoviesTableManager: ListMoviesTableItemPressed {
    
    func pressedItem(item: Datum) {
        delegate?.someMoviePressed(movie: item)
    }
        
}
