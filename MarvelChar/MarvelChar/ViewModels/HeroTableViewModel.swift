//
//  HeroTableViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import RxCocoa
import RxSwift

class HeroTableViewModel: BaseViewModel {
    
    let character = PublishRelay<[Character]>()
    let description = PublishRelay<String>()
    
    
    func getCharacter(id: Int) {
        Service.getCharacter(id)
            .observe(on: MainScheduler.instance)
            .map { characterDatawrapper in
                characterDatawrapper.data?.results ?? []
            }
            .subscribe(onNext: { [weak self] character in
                self?.character.accept(character)
                self?.description.accept(character.description)
            })
            .disposed(by: disposeBag)
    }
}
