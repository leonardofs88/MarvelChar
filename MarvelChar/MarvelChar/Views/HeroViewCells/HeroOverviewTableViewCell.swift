//
//  HeroOverviewView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class HeroOverviewTableViewCell: UITableViewCell {
    
    static let identifier = "HeroOverviewTableViewCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleView: TitleHeaderView!
}
