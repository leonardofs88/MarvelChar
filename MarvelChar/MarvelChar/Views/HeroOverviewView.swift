//
//  HeroOverviewView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 09/02/23.
//

import Foundation
import UIKit

class HeroOverviewView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView(from: .heroOverviewView)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
