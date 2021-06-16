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
        layoutHorizontalElements()
        layoutTitleLabel()
        layoutDescriptionLabel()
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
    
    private func layoutHorizontalElements() {
        
    }
    
    private func layoutTitleLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageTitle.bottomAnchor, constant: Constant.elementsSeparator).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.margin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.margin).isActive = true
    }
    
    private func layoutDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constant.elementsSeparator).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.margin).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.margin).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.elementsSeparator).isActive = true
    }
    
}
