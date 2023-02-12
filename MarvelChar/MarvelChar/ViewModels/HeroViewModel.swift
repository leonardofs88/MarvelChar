//
//  HeroTableViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import RxCocoa
import RxSwift

class HeroViewModel: BaseViewModel {
    
    override init(repository: MarvelRepositoryProtocol) {
        super.init(repository: repository)
    }
    
    func getData(for characterId: Int) -> Observable<(Character?, [Comic]?, [Event]?, [Story]?, [Series]?)> {
        Observable.zip(getCharacter(id: characterId),
                       getComics(for: characterId),
                       getEvents(for: characterId),
                       getStories(for: characterId),
                       getSeries(for: characterId))
    }
    
    fileprivate func getCharacter(id: Int) -> Observable<Character?> {
        repository.getCharacter(id)
            .observe(on: MainScheduler.instance)
            .map { characterDatawrapper in
                characterDatawrapper.data?.results?.first ?? nil
            }
    }
    
    fileprivate func getComics(for characterId: Int) -> Observable<[Comic]?> {
        repository.getComics(for: characterId)
            .observe(on: MainScheduler.instance)
            .map { comicsDataWrapper in
                comicsDataWrapper.data?.results ?? nil
            }
    }
    
    fileprivate func getEvents(for characterId: Int) -> Observable<[Event]?> {
        repository.getEvents(for: characterId)
            .observe(on: MainScheduler.instance)
            .map { eventsDataWrapper in
                eventsDataWrapper.data?.results ?? nil
            }
    }
    
    fileprivate func getStories(for characterId: Int) -> Observable<[Story]?> {
        repository.getStories(for: characterId)
            .observe(on: MainScheduler.instance)
            .map { storiesDataWrapper in
                storiesDataWrapper.data?.results ?? nil
            }
    }
    
    fileprivate func getSeries(for characterId: Int) -> Observable<[Series]?> {
        repository.getSeries(for: characterId)
            .observe(on: MainScheduler.instance)
            .map { seriesDataWrapper in
                seriesDataWrapper.data?.results ?? nil
            }
    }
}
