//
//  UIViewController+ActivityIndicator.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import UIKit

extension UIViewController {
    func showLoader() {
        let activity = UIActivityIndicatorView()
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = keyWindow else {return}
        let backgroundAlphaView = UIView(frame: window.bounds)
        backgroundAlphaView.tag = 789
        backgroundAlphaView.backgroundColor = .clear
        window.addSubview(backgroundAlphaView)
        backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
        backgroundAlphaView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        backgroundAlphaView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        backgroundAlphaView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        backgroundAlphaView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        backgroundAlphaView.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: backgroundAlphaView.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: backgroundAlphaView.centerYAnchor).isActive = true
        activity.style = .large
        activity.color = UIColor.blue
        activity.hidesWhenStopped = true
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
            guard let window = keyWindow else {return}
            if let activity = window.viewWithTag(789) {
                activity.removeFromSuperview()
            }
        }
    }
}
