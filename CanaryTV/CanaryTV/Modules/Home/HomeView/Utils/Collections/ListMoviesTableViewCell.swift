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
    private var collectionDataSource: [Datum]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .none
        titleLabel.textColor = Colors.secondary
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func fill(title: String, model: [Datum]) {
        titleLabel.text = title
        collectionDataSource = model
        //collectionView.reloadData()
    }
    
}

extension ListMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
