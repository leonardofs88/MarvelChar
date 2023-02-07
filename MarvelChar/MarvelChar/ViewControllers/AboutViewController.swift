//
//  AboutViewController.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import UIKit

class AboutViewController: UITableViewController {

    @IBOutlet weak var titleAboutLabel: UILabel!
    @IBOutlet weak var subtitleAboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TitleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroDescriptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroDescriptionTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroOverviewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroOverviewTableViewCell.identifier)
        tableView.register(UINib(nibName: HeroCollectionTypeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroCollectionTypeTableViewCell.identifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as? TitleTableViewCell,
           indexPath.row == 0 {
            cell.isSubTitle(false)
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as? TitleTableViewCell,
           indexPath.row == 1 {
            cell.isSubTitle(true)
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroDescriptionTableViewCell.identifier) as? HeroDescriptionTableViewCell,
           indexPath.row == 2 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroOverviewTableViewCell.identifier) as? HeroOverviewTableViewCell,
           indexPath.row == 3 {
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HeroCollectionTypeTableViewCell.identifier) as? HeroCollectionTypeTableViewCell,
           indexPath.row == 4 {
            cell.hideSubtitle(false)
            return cell
        }
        
        return UITableViewCell()
    }
}
