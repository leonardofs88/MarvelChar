//
//  MockMarvelEndpointRouter.swift
//  MarvelCharTests
//
//  Created by Leonardo Soares on 13/02/23.
//

import Foundation
import Alamofire

enum MockMarvelEndpoinRouter: URLRequestConvertible {
    case getCharacters
    case getSingleCharacter
    case getComics
    case getEvents
    case getStories
    case getSeries
    
    func asURLRequest() throws -> URLRequest {
        let path = Bundle.main.url(forResource: fileName, withExtension: "json")!
        return URLRequest(url: path)
    }
    
    var fileName: String {
        switch self {
        case .getCharacters:
            return "CharacterDataWrapper"
        case .getSingleCharacter:
            return "SingleCharacterDataWrapper"
        case .getComics:
            return "ComicsDataWrapper"
        case .getEvents:
            return "EventsDataWrapper"
        case .getStories:
            return "StoriesDataWrapper"
        case .getSeries:
            return "SeriesDataWrapper"
        }
    }
}
