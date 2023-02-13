//
//  UILabel+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import UIKit

extension UILabel {
    func setShadowTextField(color: UIColor) {
        textColor = color
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.masksToBounds = false
    }
}
