//
//  EventDataWrapper.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 11/02/23.
//

import Foundation

struct EventDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let data: EventData?
}