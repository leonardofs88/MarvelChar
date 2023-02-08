//
//  HomeViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    let characters = PublishRelay<[Character]>()
    
    func getCharacters() {
        Service.getCharacters()
            .observe(on: MainScheduler.instance)
            .map { characterDatawrapper in
                characterDatawrapper.data?.results ?? []
            }
            .subscribe { [weak self] characters in
                self?.characters.accept(characters)
            }
            .disposed(by: disposeBag)
    }
}
