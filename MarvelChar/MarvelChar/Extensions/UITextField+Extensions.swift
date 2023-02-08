//
//  UITextField+Extensions.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import UIKit

extension UITextField {
    
    func setUpSearchBar(imageName: String) {
        frame = CGRect(x: 18, y: 165, width: 339, height: 48)
        font = UIFont.systemFont(ofSize: 18)
        layer.cornerRadius = 16
        textColor = .white
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.07)
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(
            string: LocalizableStrings.search,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        setLeftImage(imageName: imageName)
    }
    
    fileprivate func setLeftImage(imageName: String) {
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
