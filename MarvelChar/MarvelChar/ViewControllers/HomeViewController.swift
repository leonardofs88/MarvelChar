//
//  HomeViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var searchTextField: UITextField!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        setUpSearchBar()
    }
    
    fileprivate func setUpTitle() {
        let title = """
                    Avengers,
                    Assemble!
                    """
        let mutableString = NSMutableAttributedString(string: title,
                                                      attributes: [NSAttributedString.Key.font :
                                                                    UIFont.systemFont(ofSize: 36,
                                                                                      weight: .semibold)])
        mutableString.addAttribute(NSAttributedString.Key.font,
                                   value: UIFont.systemFont(ofSize: 40, weight: .bold),
                                   range: NSRange(location:9,length:9))
        
        titleLabel.attributedText = mutableString
        titleLabel.layoutIfNeeded()
    }
    
    fileprivate func setUpSearchBar() {
        searchTextField.frame = CGRect(x: 18, y: 165, width: 339, height: 48)
        searchTextField.font = UIFont.systemFont(ofSize: 18)
        searchTextField.layer.cornerRadius = 16
        searchTextField.textColor = .white
        searchTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.07)
        searchTextField.clipsToBounds = true
        searchTextField.setLeftImage(imageName: "searchLens")
    }
    
    
}
