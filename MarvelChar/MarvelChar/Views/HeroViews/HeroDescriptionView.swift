//
//  HeroDescriptionView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 09/02/23.
//

import Foundation
import UIKit

class HeroDescriptionView: BaseView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView(from: .heroDescriptionView)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
}
