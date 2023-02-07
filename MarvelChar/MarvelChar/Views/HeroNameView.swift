//
//  HeroNameView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

class HeroNameView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView(from: "HeroNameView")
        contentView.frame = bounds
        addSubview(contentView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpSubviews()
    }
    
    override func setUpSubviews() {
        heroNameLabel.textColor = .white
        heroNameLabel.layer.shadowColor = UIColor.black.cgColor
        heroNameLabel.layer.shadowRadius = 1.0
        heroNameLabel.layer.shadowOpacity = 1.0
        heroNameLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        heroNameLabel.layer.masksToBounds = false
        backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
    }
    
    
    func showShareButton() {
        shareButton.isHidden = false
    }
}
