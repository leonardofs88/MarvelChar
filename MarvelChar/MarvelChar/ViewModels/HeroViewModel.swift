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
    
    let character = PublishRelay<[Character]>()
    let description = PublishRelay<String>()
    
    
    func getCharacter(id: Int) -> Observable<Character?> {
        Service.getCharacter(id)
            .observe(on: MainScheduler.instance)
            .map { characterDatawrapper in
                characterDatawrapper.data?.results?.first ?? nil
            }
    }
}
