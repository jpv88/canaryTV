//
//  ListMoviesTableViewCell.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class ListMoviesTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .none
        titleLabel.textColor = Colors.secondary
    }
    
    func fill(title: String, model: [Datum]) {
        titleLabel.text = title
    }
}
