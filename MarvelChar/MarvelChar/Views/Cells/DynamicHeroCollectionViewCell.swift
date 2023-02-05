//
//  DynamicHeroCollectionViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

class DynamicHeroCollectionViewCell: UICollectionViewCell {
    let wide = CGFloat(180)
    let small = CGFloat(220)
    let big = CGFloat(520)
    
    static let identifier = "DynamicHeroCollectionViewCell"
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    @IBOutlet weak var heroCellContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCellStyle()
        setUpCellSubview()
    }
    
    override func prepareForReuse() {
        heroImage.image = UIImage(named: ImageName.avengersSplash)
        setUpCellStyle()
        setUpCellSubview()
    }
    
    func setUpCellStyle() {
        heroCellContentView.layer.cornerRadius = 9
        heroCellContentView.clipsToBounds = true
        contentView.layoutSubviews()
    }
    
    fileprivate func setUpCellSubview() {
        heroNameLabel.textColor = .white
        heroNameLabel.layer.shadowColor = UIColor.black.cgColor
        heroNameLabel.layer.shadowRadius = 1.0
        heroNameLabel.layer.shadowOpacity = 1.0
        heroNameLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        heroNameLabel.layer.masksToBounds = false
        heroNameView.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
    }
    
}
