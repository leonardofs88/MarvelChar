//
//  UITextField+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import UIKit

extension UITextField {
    func setLeftImage(imageName:String) {
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: imageName)

        let leftView = UIView()
        leftView.addSubview(leftImageView)

        leftView.frame = CGRectMake(0, 0, 48, 48)
        leftImageView.frame = CGRectMake(18, 16, 18, 18)
        leftViewMode = .always
        self.leftView = leftView
    }
}
