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

class MockMarvelRepository: MarvelRepositoryProtocol {
    func getCharacter(_ id: Int) -> Observable<CharacterDataWrapper> {
        if let dataWrapper = getSingleCharacterDataWrapper() {
            return Observable<CharacterDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func getComics(for characterId: Int) -> Observable<ComicsDataWrapper> {
        if let dataWrapper = getComicsDataWrapper() {
            return Observable<ComicsDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func getEvents(for characterId: Int) -> Observable<EventDataWrapper> {
        if let dataWrapper = getEventDataWrapper() {
            return Observable<EventDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func getStories(for characterId: Int) -> Observable<StoriesDataWrapper> {
        if let dataWrapper = getStoriesDataWrapper() {
            return Observable<StoriesDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func getSeries(for characterId: Int) -> Observable<SeriesDataWrapper> {
        if let dataWrapper = getSeriesDataWrapper() {
            return Observable<SeriesDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func getImage(URL: URL) -> Observable<Image> {
        Observable<Image>.just(.emptyCharacterImage)
    }
    
    func getCharacters(for page: Int, named: String?) -> Observable<CharacterDataWrapper> {
        if let dataWrapper = getCharacterDataWrapper() {
            return Observable<CharacterDataWrapper>.just(dataWrapper)
        } else {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    fileprivate func getSingleCharacterDataWrapper() -> CharacterDataWrapper? {
        var characterData: CharacterDataWrapper?
        if let path = Bundle.main.path(forResource: "SingleCharacterDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? CharacterDataWrapper {
                    characterData = jsonResult
                }
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return characterData
    }
    
    
    fileprivate func getCharacterDataWrapper() -> CharacterDataWrapper? {
        if let path = Bundle.main.path(forResource: "CharacterDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
                return jsonResult
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return nil
    }
    
    fileprivate func getComicsDataWrapper() -> ComicsDataWrapper? {
        var characterData: ComicsDataWrapper?
        if let path = Bundle.main.path(forResource: "ComicsDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? ComicsDataWrapper {
                    characterData = jsonResult
                }
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return characterData
    }
    
    fileprivate func getEventDataWrapper() -> EventDataWrapper? {
        var characterData: EventDataWrapper?
        if let path = Bundle.main.path(forResource: "EventDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? EventDataWrapper {
                    characterData = jsonResult
                }
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return characterData
    }
    
    fileprivate func getStoriesDataWrapper() -> StoriesDataWrapper? {
        var characterData: StoriesDataWrapper?
        if let path = Bundle.main.path(forResource: "StoriesDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? StoriesDataWrapper {
                    characterData = jsonResult
                }
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return characterData
    }
    
    fileprivate func getSeriesDataWrapper() -> SeriesDataWrapper? {
        var characterData: SeriesDataWrapper?
        if let path = Bundle.main.path(forResource: "SeriesDataWrapper", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? SeriesDataWrapper {
                    characterData = jsonResult
                }
            } catch {
                XCTFail("Shouldn't have failed")
            }
        }
        return characterData
    }
}
