//
//  DynamicHeroCollectionViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

class DynamicHeroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroCellContentView: UIView!
    @IBOutlet weak var heroNameView: UIView!
    
    @IBOutlet weak var heroNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCellStyle()
    }
    
    override func prepareForReuse() {
        heroImage.image = UIImage(named: ImageName.avengersSplash)
        setUpCellStyle()
    }
    
    func setUpCellStyle() {
        heroCellContentView.layer.cornerRadius = 9
        heroCellContentView.clipsToBounds = true
        
        heroNameLabel.textColor = .white
        heroNameLabel.layer.shadowColor = UIColor.black.cgColor
        heroNameLabel.layer.shadowRadius = 1.0
        heroNameLabel.layer.shadowOpacity = 1.0
        heroNameLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        heroNameLabel.layer.masksToBounds = false
        heroNameView.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
        contentView.layoutSubviews()
    }
}
