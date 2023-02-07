//
//  DynamicHeroCollectionViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit

class DynamicHeroCollectionViewCell: UICollectionViewCell {
    static let identifier = "DynamicHeroCollectionViewCell"
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroCellContentView: UIView!
    @IBOutlet weak var heroNameView: HeroNameView!
    
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
        contentView.layoutSubviews()
    }
}
