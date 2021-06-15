//
//  ListMoviesCollectionViewCell.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import UIKit

class ListMoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fill(url: URL) {
        movieImageView.load(url: url)
    }

}
