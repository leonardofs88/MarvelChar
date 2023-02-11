//
//  SeriesData.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 11/02/23.
//

import Foundation

struct SeriesData: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Series]?
}
