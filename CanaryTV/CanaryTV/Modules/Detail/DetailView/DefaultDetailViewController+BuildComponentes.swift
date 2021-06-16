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
        buildRatingLabel()
        buildYearLabel()
        buildDurationLabel()
        buildStackHorizontalElements()
        buildTitleLabel()
        buildDescriptionLabel()
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
    
    private func buildRatingLabel() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.yellow
        component.font = UIFont.Verdana(.regular, size: 12)
        component.textAlignment = .center
        ratingLabel = component
    }
    
    private func buildYearLabel() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.Verdana(.regular, size: 12)
        component.textAlignment = .center
        yearLabel = component
    }
    
    private func buildDurationLabel() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.Verdana(.regular, size: 12)
        component.textAlignment = .center
        durationLabel = component
    }
    
    private func buildStackHorizontalElements() {
        let component = UIStackView()
        component.axis = .horizontal
        component.distribution = .fillEqually
        component.alignment = .center
        component.spacing = 10
        component.addArrangedSubview(ratingLabel)
        component.addArrangedSubview(yearLabel)
        component.addArrangedSubview(durationLabel)
        detailElements = component
    }
    
    private func buildTitleLabel() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.Verdana(.bold, size: 24)        
        component.numberOfLines = 0
        titleLabel = component
    }
    
    private func buildDescriptionLabel() {
        let component = UILabel()
        component.backgroundColor = .clear
        component.textColor = Colors.secondary
        component.font = UIFont.Verdana(.regular, size: 16)
        component.numberOfLines = 0
        descriptionLabel = component
    }
    
}
