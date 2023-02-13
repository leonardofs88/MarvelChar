//
//  Book.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation

struct Book: Codable {
    let id: String
    let volumeInfo: VolumeInfo
    let shopURL: String?
}
