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
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate lazy var service = Service()
    
    fileprivate var repository: MarvelRepositoryProtocol!
    
    fileprivate var viewModel: HomeViewModel?
    
    fileprivate var page = 20
    
    fileprivate var tag = 0
    
    lazy var disposeBag = DisposeBag()
    
    @IBOutlet weak var heroesCollecionView: UICollectionView!
    
    fileprivate var currentRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = MarvelRepository(service: service)
        viewModel = HomeViewModel(repository: repository)
        viewModel?.delegate = self
        indicatorView.isHidden = false
        indicator.startAnimating()
        setUpTitle()
        setUpCollectionView()
        setUpSearchField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    fileprivate func setUpSearchField() {
        searchTextField.setUpSearchBar(imageName: ImageName.search)
        searchTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map { self.searchTextField.text }
            .subscribe(onNext: { [weak self] name in
                guard let self = self else { return }
                self.page = 20
                self.viewModel?.getCharacters(page: self.page,named: name)
                self.heroesCollecionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    fileprivate func setUpTitle() {
        avengersTitleLable.text = LocalizableStrings.avengersComma
        assembleTitleLabel.text = LocalizableStrings.assembleExclamation
    }
    
    fileprivate func setUpCollectionView() {
        heroesCollecionView.rx.setDelegate(self).disposed(by: disposeBag)
        heroesCollecionView.register(UINib(nibName: .dynamicHeroCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: .dynamicHeroCollectionViewCell)
        
        viewModel?.characters.bind(to: heroesCollecionView.rx.items(cellIdentifier: .dynamicHeroCollectionViewCell, cellType: DynamicHeroCollectionViewCell.self)) { [weak self] (_, character, cell) in
            guard let self = self else { return }
            cell.viewModel = DynamicHeroCollectionViewModel(character: character, repository: self.repository)
        }
        .disposed(by: disposeBag)
        
        heroesCollecionView.rx.modelSelected(Character.self)
            .subscribe(onNext: { [weak self] character in
                if let characterId = character.id {
                    let storyboard = UIStoryboard(name: .heroScene, bundle: nil)
                    
                    if let viewController = storyboard.instantiateViewController(withIdentifier: .heroViewController) as? HeroViewController {
                        viewController.heroId = characterId
                        if let repo = self?.repository {
                            viewController.repository = repo
                            self?.present(viewController, animated: true, completion: nil)
                        }
                    }
                } else {
                    print("error no id found")
                }
            })
            .disposed(by: disposeBag)
        
        heroesCollecionView.rx.didScroll.subscribe { [weak self] _ in
            guard let self = self else { return }
            let offSetY = self.heroesCollecionView.contentOffset.y
            let contentHeight = self.heroesCollecionView.contentSize.height
            
            if offSetY > (contentHeight - self.heroesCollecionView.frame.size.height - 100),
               let vm = self.viewModel,
               vm.isLoading {
                self.page += 20
               vm.getCharacters(page: self.page, named: self.searchTextField.text)
            }
        }
        .disposed(by: disposeBag)
        
        viewModel?.getCharacters(page: page, named: searchTextField.text)
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

extension HomeViewController: IndicatorDelegate {
    func indicatorActivity(_ toggle: Bool) {
        indicatorView.isHidden = !toggle
        if toggle {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
}
