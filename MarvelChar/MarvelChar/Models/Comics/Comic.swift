//
//  Comic.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 11/02/23.
//

import Foundation

struct Comic: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: Thumbnail?
}
