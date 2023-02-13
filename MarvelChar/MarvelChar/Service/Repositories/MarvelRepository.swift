//
//  MarvelRepository.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation

import AlamofireImage
import RxSwift

protocol MarvelRepositoryProtocol: AnyObject {
    func getCharacters(for page: Int, named: String?) -> Observable<CharacterDataWrapper>
    func getCharacter(_ id: Int) -> Observable<CharacterDataWrapper>
    func getComics(for characterId: Int) -> Observable<ComicsDataWrapper>
    func getEvents(for characterId: Int) -> Observable<EventDataWrapper>
    func getStories(for characterId: Int) -> Observable<StoriesDataWrapper>
    func getSeries(for characterId: Int) -> Observable<SeriesDataWrapper>
    func getImage(URL: URL) -> Observable<Image>
}

class MarvelRepository: MarvelRepositoryProtocol {
    
    fileprivate var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getCharacters(for page: Int, named: String? = nil) -> Observable<CharacterDataWrapper> {
        return service.request(MarvelEndpoinRouter.getCharacters(page, name: named))
    }
    
    func getCharacter(_ id: Int) -> Observable<CharacterDataWrapper> {
        return service.request(MarvelEndpoinRouter.getCharacter(id))
    }
    
    func getComics(for characterId: Int) -> Observable<ComicsDataWrapper> {
        return service.request(MarvelEndpoinRouter.getComicsFor(characterId))
    }
    
    func getEvents(for characterId: Int) -> Observable<EventDataWrapper> {
        return service.request(MarvelEndpoinRouter.getEventsFor(characterId))
    }
    
    func getStories(for characterId: Int) -> Observable<StoriesDataWrapper> {
        return service.request(MarvelEndpoinRouter.getStoriesFor(characterId))
    }
    
    func getSeries(for characterId: Int) -> Observable<SeriesDataWrapper> {
        return service.request(MarvelEndpoinRouter.getSeriesFor(characterId))
    }
    
    func getImage(URL: URL) -> Observable<Image> {
        return service.requestImage(URL: URL)
    }
}
