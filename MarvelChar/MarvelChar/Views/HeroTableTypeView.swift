//
//  HeroTableTypeView.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 10/02/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HeroTableTypeView: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var disposebag = DisposeBag()
    
    var viewModel: HeroTableTypeViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, repository: MarvelRepositoryProtocol) {
        super.init(frame: frame)
        loadView(from: .heroTableTypeView)
        contentView.frame = bounds
        addSubview(contentView)
        
        viewModel = HeroTableTypeViewModel(repository: repository)
        
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
        viewModel?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: .tableTypeCell) as? TableTypeCell {
            cell.titleLabel.text = viewModel?.items?[indexPath.row].itemTitle
            cell.descriptionLabel.text = viewModel?.items?[indexPath.row].itemDescription
            
            if let path = viewModel?.items?[indexPath.row].itemThumbnail?.path,
               let imageExtension = viewModel?.items?[indexPath.row].itemThumbnail?.imageExtension{
                viewModel?.getImage(from: "\(path).\(imageExtension)")
                    .asDriver(onErrorJustReturn: .emptyCharacterImage)
                    .map { $0 }
                    .drive(cell.cellImageView.rx.image)
                    .disposed(by: disposebag)
            }
            
            return cell
        }
        return UITableViewCell()
    }
}
