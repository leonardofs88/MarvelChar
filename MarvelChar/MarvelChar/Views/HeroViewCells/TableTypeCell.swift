//
//  TableTypeCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import UIKit

class TableTypeCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func prepareForReuse() {
        cellImageView.image = UIImage(named: ImageName.missingIcon)
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
}
