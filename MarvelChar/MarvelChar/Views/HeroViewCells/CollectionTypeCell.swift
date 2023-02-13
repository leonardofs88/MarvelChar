//
//  CollectionTypeCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import UIKit
import RxSwift

class CollectionTypeCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate lazy var disposeBag = DisposeBag()
    
    var viewModel: CollectionTypeViewModel! {
        didSet {
            loadInfo()
            bindImageView()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.setRoundedCorners(radius: 9)
    }
    
    override func prepareForReuse() {
        imageView.image = UIImage(named: ImageName.missingComic)
        descriptionLabel.text = nil
        disposeBag = DisposeBag()
    }
    
    func bindImageView() {
        showIndicator()
        viewModel.loadImage()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] image in
                guard let self = self else { return }
                self.imageView.image = image
                self.hideIndicator()
            })
            .disposed(by: disposeBag)
    }
    
    func loadInfo() {
        descriptionLabel.text = viewModel.getComicTitle()
    }
    
    fileprivate func showIndicator() {
        indicator.startAnimating()
        indicatorView.isHidden = false
    }
    
    fileprivate func hideIndicator() {
        indicator.stopAnimating()
        indicatorView.isHidden = true
    }
}
