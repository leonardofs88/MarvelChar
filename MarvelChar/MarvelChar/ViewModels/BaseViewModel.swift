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
    var googleRepository: GoogleRepositoryProtocol?
    
    init(repository: MarvelRepositoryProtocol, googleRepository: GoogleRepositoryProtocol? = nil) {
        self.repository = repository
        self.googleRepository = googleRepository
    }
    
    lazy var disposeBag = DisposeBag()
    
    func getImage(from path: String) -> Observable<Image> {
        guard let pathToUrl = URL(string: path.toHTTPS()) else { return Observable<Image>.just(.emptyCharacterImage) }
        return repository.getImage(URL: pathToUrl) 
    }
}
