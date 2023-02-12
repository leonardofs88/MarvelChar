//
//  DynamicHeroCollectionViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import RxSwift

class DynamicHeroCollectionViewModel {
    
    fileprivate var character: Character
    fileprivate var repository: MarvelRepositoryProtocol
    
    init(character: Character, repository: MarvelRepositoryProtocol) {
        self.character = character
        self.repository = repository
    }
    
    func loadImage() -> Observable<UIImage> {
        guard let path = character.thumbnail?.path else { return Observable<UIImage>.just(.emptyCharacterImage) }
        guard let imageExtension = character.thumbnail?.imageExtension else { return Observable<UIImage>.just(.emptyCharacterImage) }
        guard let url = URL(string: "\(path).\(imageExtension)".toHTTPS()) else { return Observable<UIImage>.just(.emptyCharacterImage) }
        
        return repository.getImage(URL: url)
    }
    
    func getCharacterName() -> String? {
        character.name
    }
}
