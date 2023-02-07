//
//  HeroCollectionTypeTableViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class HeroCollectionTypeTableViewCell: UITableViewCell {
    
    static let identifier = "HeroCollectionTypeTableViewCell"
    
    @IBOutlet weak var titleHeader: TitleHeaderView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CollectionTypeCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionTypeCell.identifier)
    }
}

extension HeroCollectionTypeTableViewCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension HeroCollectionTypeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionTypeCell.identifier, for: indexPath) as? CollectionTypeCell{
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HeroCollectionTypeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 284)
    }
}
