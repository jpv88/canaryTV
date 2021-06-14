//
//  ListMoviesTableViewCell.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class ListMoviesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .none
    }
    
    func fill(title: String, model: [DataContent]) {
        
    }
}
