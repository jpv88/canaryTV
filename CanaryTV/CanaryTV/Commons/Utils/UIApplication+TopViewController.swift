//
//  UIApplication+TopViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 11/6/21.
//

import UIKit
 
extension UIApplication {
    class func topViewController() -> UIViewController? {
        let base: UIViewController? = UIApplication.shared.windows.first?.rootViewController
        if let nav = base as? UINavigationController {
            return nav.visibleViewController
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return selected
            }
        }
        if let presented = base?.presentedViewController {
            return presented
        }
        return base
    }
}
