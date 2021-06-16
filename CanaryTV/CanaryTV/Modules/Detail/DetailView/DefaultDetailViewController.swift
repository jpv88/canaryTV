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
    
    internal enum Constant {
        static let title = "Detail"
        static let imageTitleHeight: CGFloat = 320
        static let elementsSeparator: CGFloat = 25
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
}

extension DefaultDetailViewController: DetailViewController {
    
    func showThisInfo(image: URL, title: String, description: String) {
        imageTitle.load(url: image)
    }
    
}
