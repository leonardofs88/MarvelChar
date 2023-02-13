//
//  UIImage+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 08/02/23.
//

import Foundation
import UIKit

extension UIImage {
    static var emptyCharacterImage: UIImage {
        UIImage(named: ImageName.avengersSplash) ?? UIImage()
    }
}
