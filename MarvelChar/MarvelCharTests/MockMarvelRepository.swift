//
//  MockMarvelRepository.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import RxSwift
import AlamofireImage
import Alamofire
import XCTest

@testable import MarvelChar

class MockMarvelRepository: MarvelRepositoryProtocol {
    
    fileprivate var service: MockService
    
    init(service: MockService) {
        self.service = service
    }
    
    func getCharacter(_ id: Int) -> Observable<CharacterDataWrapper> {
        service.request(MockMarvelEndpoinRouter.getSingleCharacter)
    }
    
    func getComics(for characterId: Int) -> Observable<ComicsDataWrapper> {
        service.request(MockMarvelEndpoinRouter.getComics)
    }
    
    func getEvents(for characterId: Int) -> Observable<EventDataWrapper> {
        return service.request(MockMarvelEndpoinRouter.getEvents)
    }
    
    func getStories(for characterId: Int) -> Observable<StoriesDataWrapper> {
        return service.request(MockMarvelEndpoinRouter.getStories)
    }
    
    func getSeries(for characterId: Int) -> Observable<SeriesDataWrapper> {
        return service.request(MockMarvelEndpoinRouter.getSeries)
    }
    
    func getImage(URL: URL) -> Observable<Image> {
        Observable<Image>.just(.emptyCharacterImage)
    }
    
    func getCharacters(for page: Int, named: String?) -> Observable<CharacterDataWrapper> {
        service.request(MockMarvelEndpoinRouter.getCharacters)
    }
}
