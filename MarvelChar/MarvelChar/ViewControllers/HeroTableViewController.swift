//
//  HeroViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HeroTableViewController: UITableViewController {
    
    fileprivate let viewModel = HeroTableViewModel()
    
    var characterId: Int? = nil
    
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    fileprivate func setUpTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        tableView.register(UINib(nibName: .heroHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: .heroHeaderTableViewCell)
        tableView.register(UINib(nibName: .heroDescriptionTableViewCell, bundle: nil), forCellReuseIdentifier: .heroDescriptionTableViewCell)
        tableView.register(UINib(nibName: .heroOverviewTableViewCell, bundle: nil), forCellReuseIdentifier: .heroOverviewTableViewCell)
        tableView.register(UINib(nibName: .heroTableTypeTableViewCell, bundle: nil), forCellReuseIdentifier: .heroTableTypeTableViewCell)
        tableView.register(UINib(nibName: .heroCollectionTypeTableViewCell, bundle: nil), forCellReuseIdentifier: .heroCollectionTypeTableViewCell)
        
        if let id = characterId {
            viewModel.character.bind(to: tableView.rx.items(cellIdentifier: .heroHeaderTableViewCell, cellType: HeroHeaderTableViewCell.self)) { [weak self] (row, character, cell) in
                cell.heroNameLabel.text = character.name
                cell.delegate = self
                if let path = character.thumbnail?.path,
                   let imageExtension = character.thumbnail?.imageExtension {
                    self?.viewModel.getImage(from: "\(path.toHTTPS()).\(imageExtension)", for: cell.heroImageView)
                }
            }
            .disposed(by: disposeBag)
            
            viewModel.description.bind(to: tableView.rx.items(cellIdentifier: .heroDescriptionTableViewCell, cellType: HeroDescriptionTableViewCell.self)) { (row, description, cell) in
                cell.descriptionLabel.text = description.description
            }
            .disposed(by: disposeBag)
            
            viewModel.getCharacter(id: id)
        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroHeaderTableViewCell) as? HeroHeaderTableViewCell,
           indexPath.section == 0 {
            cell.delegate = self
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroDescriptionTableViewCell) as? HeroDescriptionTableViewCell,
           indexPath.section == 1 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroOverviewTableViewCell) as? HeroOverviewTableViewCell,
           indexPath.section == 2 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroCollectionTypeTableViewCell) as? HeroCollectionTypeTableViewCell,
           indexPath.section == 3 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .heroTableTypeTableViewCell) as? HeroTableTypeTableViewCell{
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension HeroTableViewController: HeroHeaderTableViewCellDelegate {
    func dismissView() {
        dismiss(animated: true)
    }
}
