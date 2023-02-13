//
//  CharacterUrl.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 13/02/23.
//

import Foundation

struct CharacterUrl: Codable {
    let type: String?
    let characterUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case characterUrl = "url"
    }
}
