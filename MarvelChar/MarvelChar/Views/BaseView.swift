//
//  BaseView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

class BaseView: UIView {
    func loadView(from nibName: String) {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        setUpSubviews()
    }
    
    func setUpSubviews() {}
}
