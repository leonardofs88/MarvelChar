//
//  VolumeInfo.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation

struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let description: String?
    let imageLinks: ImageLinks?
}
