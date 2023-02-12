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
    case comics(_: [Comic])
    case table(_ : [TableTypeItem])
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
    
    var repository: MarvelRepositoryProtocol?
    fileprivate lazy var service = Service()
    
    fileprivate var viewModel: HeroViewModel?
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWidth = view.frame.width
        if let repo = repository {
            viewModel = HeroViewModel(repository: repo)
        }
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
        
        getData()
    }
    
    fileprivate func getData() {
        if let id = heroId {
            viewModel?.getData(for: id)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] characterData, comicsData, eventsData, storiesData, seriesData in
                    guard let self = self else { return }
                    if let character = characterData {
                        self.addStackViewSubview(.header(character))
                        self.addStackViewSubview(.description(character))
                        self.addStackViewSubview(.overview(character))
                        
                    }
                    if let comics = comicsData, !comics.isEmpty {
                        self.addStackViewSubview(.comics(comics))
                    }
                    
                    if let events = eventsData, !events.isEmpty {
                        self.addStackViewSubview(.table(events))
                    }
                    
                    if let stories = storiesData, !stories.isEmpty {
                        self.addStackViewSubview(.table(stories))
                    }
                    
                    if let series = seriesData, !series.isEmpty {
                        self.addStackViewSubview(.table(series))
                    }
                    
                }).disposed(by: disposeBag)
        }
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
        case .comics(let comics):
            return configComicsView(with: comics)
        case .table(let items):
            return configTableView(with: items)
        }
    }
    
    fileprivate func configHeader(with character: Character) -> UIView? {
        guard let name = character.name else { return nil }
        guard let path = character.thumbnail?.path else { return nil }
        guard let imageExtension = character.thumbnail?.imageExtension else { return nil }
        
        let header = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 354))
        
        header.delegate = self
        header.heroNameLabel.text = name
        
        viewModel?.getImage(from: "\(path).\(imageExtension)")
            .asDriver(onErrorJustReturn: .emptyCharacterImage)
            .map { $0 }
            .drive(header.heroImageView.rx.image)
            .disposed(by: disposeBag)
        
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
    
    fileprivate func configComicsView(with items: [Comic]) -> UIView? {
        guard let repository = repository else { return nil }
        let comics = HeroCollectionTypeView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 360), repository: repository)
        
        comics.titleLabel.text = LocalizableStrings.comics
        comics.viewModel?.items = items
        return comics
    }
    
    fileprivate func configTableView(with items: [TableTypeItem]) -> UIView? {
        guard let repository = repository else { return nil }
        let tableViewHeight = CGFloat(69 + (121 * items.count))
        let comics = HeroTableTypeView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: tableViewHeight), repository: repository)
        var title = ""
        
        if items is [Event]? {
            title = LocalizableStrings.events
        }
        
        if items is [Story]? {
            title = LocalizableStrings.stories
        }
        
        if items is [Series]? {
            title = LocalizableStrings.series
        }
        
        comics.titleLabel.text = title
        comics.viewModel?.items = items
        return comics
    }
}

extension HeroViewController: HeroHeaderTableViewCellDelegate {
    func dismissView() {
        dismiss(animated: true)
    }
}
