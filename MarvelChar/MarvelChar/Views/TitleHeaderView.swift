//
//  TitleHeaderView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class TitleHeaderView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView(from: "TitleHeaderView")
        contentView.frame = bounds
        addSubview(contentView)
    }
}
