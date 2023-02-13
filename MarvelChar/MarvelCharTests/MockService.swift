//
//  MockService.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import RxSwift
import AlamofireImage
import Alamofire
import XCTest

class MockService: ServiceProtocol {
    func request<T>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        Observable<T>.create { observable in
            
            return Disposables.create { }
        }
    }
    
    func requestImage(URL: URL) -> Observable<Image> {
        return Observable<Image>.just(.emptyCharacterImage)
    }
    
}
