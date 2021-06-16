//
//  DefaultDetailViewController+BuildComponentes.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import UIKit

internal extension DefaultDetailViewController {
    
    func buildView() {
        title = Constant.title
        buildScrollView()
        buildContentView()
        buildTitleImageView()
    }
    
    private func buildScrollView() {
        let component = UIScrollView()
        component.backgroundColor = .clear
        scrollView = component
    }
    
    private func buildContentView() {
        let component = UIView()
        component.backgroundColor = .clear
        contentView = component
    }
    
    private func buildTitleImageView() {
        let component = UIImageView()
        component.contentMode = .scaleAspectFit
        imageTitle = component
    }
    
}
