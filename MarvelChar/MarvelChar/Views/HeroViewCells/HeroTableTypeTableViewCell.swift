//
//  HeroTableView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class HeroTableTypeTableViewCell: UITableViewCell {
    
    static let identifier = "HeroTableTypeTableViewCell"
    
    @IBOutlet weak var titleHeaderView: TitleHeaderView!
    
    @IBOutlet weak var tableView: UITableView!
 
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: TableTypeCell.identifier, bundle: nil), forCellReuseIdentifier: TableTypeCell.identifier)
        
        tableViewHeightConstraint.constant = 111*10
        tableViewHeightConstraint.isActive = true
    }
}

extension HeroTableTypeTableViewCell: UITableViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        111
    }
}

extension HeroTableTypeTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableTypeCell.identifier) as? TableTypeCell {
            return cell
        }
        return UITableViewCell()
    }
}
