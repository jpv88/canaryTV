//
//  DefaultHomeViewController+BuildComponents.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

extension DefaultHomeViewController {
    
    func buildInfoLabelComponent() {
        let component = UILabel()
        component.text = "Info Label"
        component.backgroundColor = .white
        infoLabel = component
    }
    
}
