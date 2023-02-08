//
//  CharacterDataWrapper.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 08/02/23.
//

import Foundation

struct CharacterDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let data: CharactersData?
}
