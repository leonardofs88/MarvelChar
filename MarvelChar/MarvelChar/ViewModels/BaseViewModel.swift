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

class BaseViewModel {
    
    lazy var disposeBag = DisposeBag()
    
    func getImage(from path: String, for cellImage: UIImageView) {
        guard let pathToUrl = URL(string: path) else { return }
        Service.getImage(pathToUrl)
            .observe(on: MainScheduler.instance)
            .asDriver(onErrorJustReturn: .emptyCharacterImage)
            .map { $0 }
            .drive(cellImage.rx.image)
            .disposed(by: disposeBag)
    }
}
