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
        loadView(from: .heroNameView)
        contentView.frame = bounds
        addSubview(contentView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpSubviews()
    }
    
    override func setUpSubviews() {
        heroNameLabel.setShadowTextField(color: .white)
        backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
    }
    
    func showShareButton() {
        shareButton.isHidden = false
    }
}
