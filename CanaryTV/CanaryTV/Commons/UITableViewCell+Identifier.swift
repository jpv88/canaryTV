//
//  UITableViewCell+Identifier.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

extension UITableViewCell {
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}
