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

class HeroHeaderView: BaseView {
    
    weak var delegate: HeroHeaderTableViewCellDelegate?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView(from: .heroHeaderView)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView(from: .heroHeaderView)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpViewStyle()
    }
    
    fileprivate func setUpViewStyle() {
        heroNameLabel.setShadowTextField(color: .white)
        heroNameView.setRoundedCorners(radius: 9, for: .top)
        heroNameView.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
    }
    
    @IBAction func dismissView() {
        delegate?.dismissView()
    }
    
}
