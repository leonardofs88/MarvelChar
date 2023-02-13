//
//  Thumbnail.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation

struct Thumbnail: Codable {
    let path: String?
    let imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
