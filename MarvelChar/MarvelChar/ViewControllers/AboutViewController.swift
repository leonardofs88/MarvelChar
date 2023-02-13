//
//  AboutViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import UIKit
import RxSwift

class AboutViewController: UITableViewController {

    @IBOutlet weak var titleAboutLabel: UILabel!
    @IBOutlet weak var subtitleAboutLabel: UILabel!
    lazy var service = Service()
    lazy var disposeBag = DisposeBag()
    fileprivate var viewModel: AboutViewModel?
    fileprivate var collectionViewItems: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let googleRepo = GoogleRepository(service: service)
        let marvelRepo = MarvelRepository(service: service)
        viewModel = AboutViewModel(repository: marvelRepo, googleRepository: googleRepo)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: .titleTableViewCell, bundle: nil), forCellReuseIdentifier: .titleTableViewCell)
        tableView.register(UINib(nibName: .heroDescriptionTableViewCell, bundle: nil), forCellReuseIdentifier: .heroDescriptionTableViewCell)
        tableView.register(UINib(nibName: .heroOverviewTableViewCell, bundle: nil), forCellReuseIdentifier: .heroOverviewTableViewCell)
        tableView.register(UINib(nibName: .heroCollectionTypeTableViewCell, bundle: nil), forCellReuseIdentifier: .heroCollectionTypeTableViewCell)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .titleTableViewCell) as? TitleTableViewCell,
           indexPath.row == 0 {
            cell.isSubTitle(false)
            cell.titleLabel.text = LocalizableStrings.aboutScreenTitle
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .titleTableViewCell) as? TitleTableViewCell,
           indexPath.row == 1 {
            cell.isSubTitle(true)
            cell.titleLabel.text = LocalizableStrings.aboutScreenSubtitle
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroDescriptionTableViewCell) as? HeroDescriptionTableViewCell,
           indexPath.row == 2 {
            cell.descriptionLabel.text = LocalizableStrings.aboutScreenDescription
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroOverviewTableViewCell) as? HeroOverviewTableViewCell,
           indexPath.row == 3 {
            cell.descriptionLabel.text = LocalizableStrings.aboutScreenOverviewDescription
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroCollectionTypeTableViewCell) as? HeroCollectionTypeTableViewCell,
           indexPath.row == 4 {
            cell.titleHeader.headerLabel.text = LocalizableStrings.googleBooks
            cell.subtitleLabel.text = LocalizableStrings.googleBooksSubtitle
            cell.viewModel = HeroCollectionTypeViewModel(repository: MarvelRepository(service: service), googleRepository: GoogleRepository(service: service))
            cell.hideSubtitle(false)
            viewModel?.getBooks()?
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { booksWrapper in
                    cell.books = booksWrapper.items
                }).disposed(by: disposeBag)
            return cell
        }
        
        return UITableViewCell()
    }
}
