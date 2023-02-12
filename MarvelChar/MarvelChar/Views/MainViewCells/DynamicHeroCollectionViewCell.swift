//
//  DynamicHeroCollectionViewCell.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 05/02/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class DynamicHeroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroCellContentView: UIView!
    @IBOutlet weak var heroNameView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate lazy var disposeBag = DisposeBag()
    
    @IBOutlet weak var indicatorView: UIView!
    
    var viewModel: DynamicHeroCollectionViewModel! {
        didSet {
            loadInfo()
            bindImageView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicator.hidesWhenStopped = true
        setUpCellStyle()
    }
    
    override func prepareForReuse() {
        heroImage.image = UIImage(named: ImageName.avengersSplash)
        heroNameLabel.text = nil
        disposeBag = DisposeBag()
    }
    
    func bindImageView() {
        showIndicator()
        viewModel.loadImage()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] image in
                guard let self = self else { return }
                self.heroImage.image = image
                self.hideIndicator()
            })
            .disposed(by: disposeBag)
    }
    
    func loadInfo() {
        heroNameLabel.text = viewModel.getCharacterName()
    }
    
    fileprivate func setUpCellStyle() {
        heroCellContentView.setRoundedCorners(radius: 9)
        heroCellContentView.clipsToBounds = true
        
        heroNameLabel.setShadowTextField(color: .white)
        heroNameView.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5)
        contentView.layoutSubviews()
    }
    
    fileprivate func showIndicator() {
        indicator.startAnimating()
        indicator.isHidden = false
        indicatorView.isHidden = false
    }
    
    fileprivate func hideIndicator() {
        indicator.stopAnimating()
        indicatorView.isHidden = true
    }
}
