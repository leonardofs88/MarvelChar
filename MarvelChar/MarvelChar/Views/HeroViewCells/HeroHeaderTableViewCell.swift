//
//  HeroHeaderView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

protocol HeroHeaderTableViewCellDelegate: AnyObject {
    func dismissView()
}

class HeroHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "HeroHeaderTableViewCell"
    
    weak var delegate: HeroHeaderTableViewCellDelegate?

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameView: HeroNameView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpViewStyle()
    }
    
    fileprivate func setUpViewStyle() {
        heroNameView.layer.cornerRadius = 9
        heroNameView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        heroNameView.showShareButton()
    }
    
    @IBAction func dismissView() {
        delegate?.dismissView()
    }
    
}
