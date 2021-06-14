//
//  DefaultHomeViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class DefaultHomeViewController: BaseViewController {
    
    var infoLabel: UILabel!
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewDidLoad()
    }
    
    override func buildComponents() {
        super.buildComponents()
        buildInfoLabelComponent()
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        layoutInfoLabelComponent()
    }
}

extension DefaultHomeViewController: HomeViewController {
    
    func showLoadedInfo() {
        
    }
        
}
