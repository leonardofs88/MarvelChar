//
//  UIView+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import UIKit

enum ViewCorners {
    case top
    case bottom
    case all
}

extension UIView {
    func setRoundedCorners(radius: CGFloat, for corners: ViewCorners = .all) {
        layer.cornerRadius = radius
        switch corners {
        case .top:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case .bottom:
            layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case .all:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
}
