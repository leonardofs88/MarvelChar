//
//  CharactersData.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 08/02/23.
//

import Foundation

struct CharactersData: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}
