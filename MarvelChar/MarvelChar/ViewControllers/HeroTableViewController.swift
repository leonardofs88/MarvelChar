//
//  HeroViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 06/02/23.
//

import Foundation
import UIKit

class HeroTableViewController: UITableViewController {
    
    static var nibName = "HeroTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: HeroHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroHeaderTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroDescriptionTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroOverviewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroOverviewTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroTableTypeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroTableTypeTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroCollectionTypeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroCollectionTypeTableViewCell.identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroHeaderTableViewCell.identifier) as? HeroHeaderTableViewCell,
           indexPath.section == 0 {
            cell.delegate = self
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroDescriptionTableViewCell.identifier) as? HeroDescriptionTableViewCell,
           indexPath.section == 1 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroOverviewTableViewCell.identifier) as? HeroOverviewTableViewCell,
           indexPath.section == 2 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroCollectionTypeTableViewCell.identifier) as? HeroCollectionTypeTableViewCell,
           indexPath.section == 3 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroTableTypeTableViewCell.identifier) as? HeroTableTypeTableViewCell{
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
