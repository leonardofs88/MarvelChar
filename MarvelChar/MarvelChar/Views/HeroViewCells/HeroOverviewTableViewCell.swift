//
//  HeroOverviewView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class HeroOverviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleView: TitleHeaderView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleView.headerLabel.text = LocalizableStrings.overview
    }
}
