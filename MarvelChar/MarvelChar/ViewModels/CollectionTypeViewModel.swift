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
    fileprivate var comic: Comic
    
    init(comic: Comic, repository: MarvelRepositoryProtocol) {
        self.comic = comic
        super.init(repository: repository)
    }
    
    func loadImage() -> Observable<UIImage> {
        guard let path = comic.thumbnail?.path else { return Observable<UIImage>.just(.emptyCharacterImage) }
        guard let imageExtension = comic.thumbnail?.imageExtension else { return Observable<UIImage>.just(.emptyCharacterImage) }
                
        return getImage(from: "\(path).\(imageExtension)")
    }
    
    func getComicTitle() -> String? {
        comic.title
    }
}
