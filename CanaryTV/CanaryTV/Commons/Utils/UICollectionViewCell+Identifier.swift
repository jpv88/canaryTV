//
//  UICollectionViewCell+Identifier.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 15/6/21.
//

import UIKit

extension UICollectionViewCell {
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}
