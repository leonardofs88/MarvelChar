//
//  ImageLinks.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation

struct ImageLinks: Codable, Equatable {
    let smallThumbnail: String
    let thumbnail: String
    
    var thumbnailURL: String {
        return thumbnail.replacingOccurrences(of: "http", with: "https")
    }
    
    var smalltThumbnailURL: String {
        return smallThumbnail.replacingOccurrences(of: "http", with: "https")
    }
}
