//
//  HeroViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 09/02/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

enum HeroSubviewType {
    case header(_: Character)
    case description(_: Character)
    case overview(_: Character)
    case comics
    case table
}

class HeroViewController: UIViewController {
    
    fileprivate var viewWidth: CGFloat!
    
    var heroId: Int?
    
    let scrollView: UIScrollView  = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 0
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel = HeroViewModel()
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWidth = view.frame.width
        configureView()
    }
    
    fileprivate func configureView() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        if let id = heroId {
            viewModel.getCharacter(id: id)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] data in
                    guard let self = self else { return }
                    guard let character = data else { return }
                    self.addStackViewSubview(.header(character))
                    self.addStackViewSubview(.description(character))
                    self.addStackViewSubview(.overview(character))
                })
                .disposed(by: disposeBag)
        }
//        addStackViewSubview(.description)
//        addStackViewSubview(.overview)
//        addStackViewSubview(.comics)
//        addStackViewSubview(.table)
//        addStackViewSubview(.table)
//        addStackViewSubview(.table)
        
    }
    
    fileprivate func addStackViewSubview(_ type: HeroSubviewType) {
        guard let view = getSubview(for: type) else { return }
        view.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        view.backgroundColor = .marvelCarbon
        stackView.addArrangedSubview(view)
    }
    
    fileprivate func getSubview(for type: HeroSubviewType) -> UIView? {
        
        switch type {
        case .header(let character):
            return configHeader(with: character)
        case .description(let character):
            return configDescriptionView(with: character)
        case .overview(let character):
            return configOverview(with: character)
        case .comics:
            return HeroCollectionTypeView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 360))
        case .table:
            return HeroTableTypeView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 674))
        }
    }
    
    fileprivate func configHeader(with character: Character) -> UIView? {
        guard let name = character.name else { return nil }
        guard let path = character.thumbnail?.path else { return nil }
        guard let imageExtension = character.thumbnail?.imageExtension else { return nil }
        
        let header = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 354))
        
        header.heroNameLabel.text = name
        
        viewModel.getImage(from: "\(path.toHTTPS()).\(imageExtension)", for: header.heroImageView)
        
        return header
    }
    
    fileprivate func configDescriptionView(with character: Character) -> UIView? {
        guard let quote = character.quote else { return nil }
        if quote.isEmpty { return nil }
        
        let description = HeroDescriptionView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 148))
        description.descriptionTextView.text = quote
        return description
    }
    
    fileprivate func configOverview(with character: Character) -> UIView? {
        guard let description = character.description else { return nil }
        if description.isEmpty { return nil }
        
        let overview = HeroOverviewView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 376))
        
        overview.title.text = LocalizableStrings.overview
        overview.descriptionText.text = description
        
        return overview
    }
}
