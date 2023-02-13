//
//  HomeViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol IndicatorDelegate: AnyObject {
    func indicatorActivity(_ toggle: Bool)
}

class HomeViewModel: BaseViewModel {
    let characters = PublishRelay<[Character]>()
    var isLoading = false
    
    weak var delegate: IndicatorDelegate?
    
    func getCharacters(page: Int, named: String? = nil) {
        isLoading = true
        delegate?.indicatorActivity(isLoading)
        repository.getCharacters(for: page, named: named)
            .observe(on: MainScheduler.instance)
            .map { characterDatawrapper in
                characterDatawrapper.data?.results ?? []
            }
            .subscribe(onNext: { [weak self] characters in
                guard let self = self else { return }
                self.isLoading = false
                self.delegate?.indicatorActivity(self.isLoading)
                if let nameForSearch = named,
                   !nameForSearch.isEmpty,
                   page == 20 {
                    self.characters.accept([])
                }
                if !characters.isEmpty {
                    self.characters.accept(characters)
                }
            })
            .disposed(by: disposeBag)
    }
}
