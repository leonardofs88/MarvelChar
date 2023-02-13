//
//  HeroCollectionTypeTableViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HeroCollectionTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleHeader: TitleHeaderView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var subtitleHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var subtitleBottomConstraint: NSLayoutConstraint!
    
    var books: [Book]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var viewModel: HeroCollectionTypeViewModel?
    lazy var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: .collectionTypeCell, bundle: nil), forCellWithReuseIdentifier: .collectionTypeCell)
        hideSubtitle()
    }
    
    func hideSubtitle(_ hide: Bool = true) {
        subtitleLabel.isHidden = hide
        subtitleHeightConstraint.constant = hide ? 0 : 24
        subtitleBottomConstraint.constant = hide ? 0 : 18
    }
}

extension HeroCollectionTypeTableViewCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension HeroCollectionTypeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .collectionTypeCell, for: indexPath) as? CollectionTypeCell {
            cell.descriptionLabel.text = books?[indexPath.row].volumeInfo.title
            if let path = books?[indexPath.row].volumeInfo.imageLinks?.thumbnailURL {
                viewModel?.getImage(from: path)
                    .observe(on: MainScheduler.instance)
                    .subscribe(onNext: { image in
                        cell.imageView.image = image
                    })
                    .disposed(by: disposeBag)
            }
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
