//
//  DefaultDetailViewController+Layout.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import Foundation

import UIKit

internal extension DefaultDetailViewController {
    
    func layoutView() {
        layoutScrollView()
        layoutTitleImageView()
    }
    
    private func layoutScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func layoutTitleImageView() {
        contentView.addSubview(imageTitle)
        
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageTitle.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageTitle.heightAnchor.constraint(equalToConstant: Constant.imageTitleHeight).isActive = true
    }
}
