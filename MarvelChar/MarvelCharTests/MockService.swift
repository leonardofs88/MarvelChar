//
//  MockService.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import AlamofireImage
import Alamofire
import XCTest

@testable import RxSwift
@testable import MarvelChar

class MockService: ServiceProtocol {
    func request<T: Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        do {
            if let url = urlConvertible.urlRequest?.url {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(T.self, from: data)
                return Observable<T>.just(jsonResult)
            } else {
                return Observable.error(AFError.explicitlyCancelled)
            }
        } catch {
            return Observable.error(AFError.explicitlyCancelled)
        }
    }
    
    func requestImage(URL: URL) -> Observable<Image> {
        return Observable<Image>.just(.emptyCharacterImage)
    }
    
}
