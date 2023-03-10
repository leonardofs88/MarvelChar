//
//  HeroCollectionTypeView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 10/02/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HeroCollectionTypeView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate lazy var disposeBag = DisposeBag()
    
    var repository: MarvelRepositoryProtocol?
    
    var viewModel: HeroCollectionTypeViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, repository: MarvelRepositoryProtocol) {
        super.init(frame: frame)
        loadView(from: .heroCollectionTypeView)
        contentView.frame = bounds
        addSubview(contentView)
        
        self.repository = repository
        self.viewModel = HeroCollectionTypeViewModel(repository: repository)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: .collectionTypeCell, bundle: nil), forCellWithReuseIdentifier: .collectionTypeCell)
    }
}

extension HeroCollectionTypeView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension HeroCollectionTypeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .collectionTypeCell, for: indexPath) as? CollectionTypeCell {
            if let comic = viewModel?.items?[indexPath.row],
               let repo = repository {
                cell.viewModel = CollectionTypeViewModel(comic: comic, repository: repo)
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HeroCollectionTypeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 273)
    }
}
