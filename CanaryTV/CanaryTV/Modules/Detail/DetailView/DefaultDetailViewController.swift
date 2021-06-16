//
//  DefaultDetailViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import UIKit

class DefaultDetailViewController: BaseViewController {
    
    var presenter: DetailPresenter?
    internal var scrollView: UIScrollView!
    internal var contentView: UIView!
    internal var imageTitle: UIImageView!
    internal var trailerButton: UIButton!
    internal var ratingLabel: UILabel!
    internal var yearLabel: UILabel!
    internal var durationLabel: UILabel!
    internal var detailElements: UIStackView!
    internal var titleLabel: UILabel!
    internal var descriptionLabel: UILabel!
    
    internal enum Constant {
        static let title = "Detail"
        static let trailerButton = "Trailer"
        static let imageTitleHeight: CGFloat = 320
        static let elementsSeparator: CGFloat = 25
        static let margin: CGFloat = 16
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildView()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutView()
    }
    
    @objc func trailerButtonTapped(sender : UIButton) {
        presenter?.showTrailer()
    }
}

extension DefaultDetailViewController: DetailViewController {
    
    func showThisInfo(image: URL, title: String, description: String, rating: String, year: String, duration: String) {
        imageTitle.load(url: image)
        titleLabel.text = title
        descriptionLabel.text = description
        ratingLabel.text = rating
        yearLabel.text = year
        durationLabel.text = duration
    }
    
}
