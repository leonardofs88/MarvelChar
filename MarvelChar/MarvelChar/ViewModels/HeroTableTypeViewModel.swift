//
//  HeroTableTypeViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 11/02/23.
//

import Foundation

protocol TableTypeItem {
    var itemId: Int? { get }
    var itemTitle: String? { get }
    var itemDescription: String? { get }
    var itemThumbnail: Thumbnail? { get }
}

class HeroTableTypeViewModel: BaseViewModel {
    var items: [TableTypeItem]?
}
