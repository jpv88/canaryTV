//
//  DefaultHomeViewController+Layout.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

extension DefaultHomeViewController {
    
    func layoutInfoLabelComponent() {
        view.addSubview(infoLabel)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
