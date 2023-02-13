//
//  GoogleRepository.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import RxSwift

class GoogleApi {
    static let baseURL = "https://www.googleapis.com"
}

protocol GoogleRepositoryProtocol: AnyObject {
    func getBooks() -> Observable<BookDataWrapper>
}

class GoogleRepository: GoogleRepositoryProtocol {
    
    fileprivate var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getBooks() -> Observable<BookDataWrapper> {
        service.request(GoogleEndpointRouter.getBooks)
    }
}
