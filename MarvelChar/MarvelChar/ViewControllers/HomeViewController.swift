//
//  HomeViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var avengersTitleLable: UILabel!
    @IBOutlet weak var assembleTitleLabel: UILabel!
    
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
        heroesCollecionView.delegate = self
        heroesCollecionView.dataSource = self
        
        heroesCollecionView.register(UINib(nibName: DynamicHeroCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DynamicHeroCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HeroScene", bundle: nil)
           
        if let viewController = storyboard.instantiateViewController(withIdentifier: HeroTableViewController.nibName) as? HeroTableViewController {
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DynamicHeroCollectionViewCell.identifier, for: indexPath) as? DynamicHeroCollectionViewCell {
            return cell
        }
        
        return UICollectionViewCell()
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
