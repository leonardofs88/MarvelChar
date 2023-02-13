//
//  AboutViewModel.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 04/02/23.
//

import Foundation
import RxSwift

class AboutViewModel: BaseViewModel {
    func getBooks() -> Observable<BookDataWrapper>? {
        googleRepository?.getBooks()
    }
}
