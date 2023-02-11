//
//  Character.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation

struct Character: Codable {
    let id: Int?
    let name: String?
    let quote: String?
    let description: String?
    let thumbnail: Thumbnail?
}
