//
//  DefaultHomePresenter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomePresenter: HomePresenter {
    
    var router: HomeRouter?
    
    func onViewDidLoad() {
        print("Im HomePresenter")
    }
        
}
