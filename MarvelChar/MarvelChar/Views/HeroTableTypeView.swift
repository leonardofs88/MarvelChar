//
//  HeroTableTypeView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 10/02/23.
//

import Foundation
import UIKit

class HeroTableTypeView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView(from: .heroTableTypeView)
        contentView.frame = bounds
        addSubview(contentView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: .tableTypeCell, bundle: nil), forCellReuseIdentifier: .tableTypeCell)
    }
}

extension HeroTableTypeView: UITableViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        111
    }
}

extension HeroTableTypeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: .tableTypeCell) as? TableTypeCell {
            return cell
        }
        return UITableViewCell()
    }
}
