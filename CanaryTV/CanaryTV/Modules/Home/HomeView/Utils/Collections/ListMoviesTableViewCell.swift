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
        collectionView.register(UINib(nibName: ListMoviesCollectionViewCell.getIdentifier(), bundle: nil), forCellWithReuseIdentifier: ListMoviesCollectionViewCell.getIdentifier())
    }
    
    func fill(title: String, model: [Datum]) {
        titleLabel.text = title
        collectionDataSource = model
    }
    
}

extension ListMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dataSource = collectionDataSource else { return }
        print("I am the element: \(dataSource[indexPath.row]) in the position: \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListMoviesCollectionViewCell.getIdentifier(), for: indexPath) as? ListMoviesCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let dataSource = collectionDataSource else {
            return UICollectionViewCell()
        }
        guard let image = dataSource[indexPath.row].images?.snapshot, let imageURL = URL(string: image) else {
            return UICollectionViewCell()
        }
        cell.fill(url: imageURL)
        return cell
    }
    
}
