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
        
        scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func layoutTitleImageView() {
        contentView.addSubview(imageTitle)
        
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.elementsSeparator).isActive = true
        imageTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageTitle.heightAnchor.constraint(equalToConstant: Constant.imageTitleHeight).isActive = true
    }
}
