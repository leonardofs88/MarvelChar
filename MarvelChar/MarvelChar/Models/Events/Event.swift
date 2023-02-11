//
//  Event.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 11/02/23.
//

import Foundation

struct Event: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
}

extension Event: TableTypeItem {
    var itemId: Int? {
        get { id }
    }
    
    var itemTitle: String? {
        get { title }
    }
    
    var itemDescription: String? {
        get { description }
    }
    
    var itemThumbnail: Thumbnail? {
        get { thumbnail }
    }
}
