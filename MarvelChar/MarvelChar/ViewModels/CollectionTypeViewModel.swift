//
//  CollectionTypeViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import RxSwift
import UIKit

class CollectionTypeViewModel: BaseViewModel {
    fileprivate var character: Character
    
    init(character: Character, repository: MarvelRepositoryProtocol) {
        self.character = character
        super.init(repository: repository)
    }
    
    func loadImage() -> Observable<UIImage> {
        guard let path = character.thumbnail?.path else { return Observable<UIImage>.just(.emptyCharacterImage) }
        guard let imageExtension = character.thumbnail?.imageExtension else { return Observable<UIImage>.just(.emptyCharacterImage) }
                
        return getImage(from: "\(path).\(imageExtension)")
    }
    
    func getCharacterDescription() -> String? {
        character.description
    }
}
