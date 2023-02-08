//
//  HomeViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var avengersTitleLable: UILabel!
    @IBOutlet weak var assembleTitleLabel: UILabel!
    
    fileprivate let viewModel = HomeViewModel()
    
    lazy var disposeBag = DisposeBag()
    
    @IBOutlet weak var heroesCollecionView: UICollectionView!
    
    fileprivate var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        searchTextField.setUpSearchBar(imageName: ImageName.search)
        setUpCollectionView()
    }
    
    fileprivate func setUpTitle() {
        avengersTitleLable.text = LocalizableStrings.avengersComma
        assembleTitleLabel.text = LocalizableStrings.assembleExclamation
    }
    
    fileprivate func setUpCollectionView() {
        heroesCollecionView.rx.setDelegate(self).disposed(by: disposeBag)
        heroesCollecionView.register(UINib(nibName: .dynamicHeroCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: .dynamicHeroCollectionViewCell)
        
        viewModel.characters.bind(to: heroesCollecionView.rx.items(cellIdentifier: .dynamicHeroCollectionViewCell, cellType: DynamicHeroCollectionViewCell.self)) { [weak self] (row,character,cell) in
            cell.heroNameLabel.text = character.name
            if let imagePath = character.thumbnail?.path,
               let imageExtension = character.thumbnail?.imageExtension {
                self?.viewModel.getImage(from: "\(imagePath.toHTTPS()).\(imageExtension)",
                                        for: cell.heroImage)
            }
        }
        .disposed(by: disposeBag)
        
        heroesCollecionView.rx.modelSelected(Character.self)
            .subscribe(onNext: { [weak self] character in
                if let characterId = character.id {
                    let storyboard = UIStoryboard(name: .heroScene, bundle: nil)
                    
                    if let viewController = storyboard.instantiateViewController(withIdentifier: .heroTableViewController) as? HeroTableViewController {
                        viewController.characterId = characterId
                        self?.present(viewController, animated: true, completion: nil)
                    }
                } else {
                    print("error no id found")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.getCharacters()
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = heroesCollecionView.frame.width
        switch currentRow {
        case 0...1:
            currentRow += 1
            return CGSize(width: collectionViewSize, height: CGFloat(180))
        case 2...3:
            currentRow += 1
            return CGSize(width: (collectionViewSize - 10)/2, height: CGFloat(220))
        default:
            currentRow = 0
            return CGSize(width: collectionViewSize, height: CGFloat(520))
        }
    }
}
