//
//  CollectionTypeCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import UIKit

class CollectionTypeCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        imageView.image = UIImage(named: ImageName.missingComic)
        descriptionLabel.text = nil
    }
}
