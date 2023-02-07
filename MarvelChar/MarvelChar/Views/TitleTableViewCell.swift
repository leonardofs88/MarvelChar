//
//  TitleTableViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func isSubTitle(_ subtitle: Bool) {
        if subtitle {
            titleLabel.font = UIFont.systemFont(ofSize: 27, weight: .semibold)
        } else {
            titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        }
    }
}
