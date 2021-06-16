//
//  Fonts.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import UIKit

extension UIFont {

    public enum VerdanaFont: String {
        case regular = ""
        case italic = "-Italic"
        case boldItalic = "-BoldItalic"
        case bold = "-Bold"
    }

    static func Verdana(_ type: VerdanaFont = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont? {
        return UIFont(name: "Verdana\(type.rawValue)", size: size)
    }

}
