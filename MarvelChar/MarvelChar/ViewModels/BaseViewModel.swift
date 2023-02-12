//
//  BaseViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 08/02/23.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit
import AlamofireImage

class BaseViewModel {
    
    var repository: MarvelRepositoryProtocol
    
    init(repository: MarvelRepositoryProtocol) {
        // exposing init
        self.repository = repository
    }
    
    lazy var disposeBag = DisposeBag()
    
    func getImage(from path: String) -> Observable<Image> {
        guard let pathToUrl = URL(string: path.toHTTPS()) else { return Observable<Image>.just(.emptyCharacterImage) }
        return repository.getImage(URL: pathToUrl) ?? Observable<Image>.just(.emptyCharacterImage)
    }
}
