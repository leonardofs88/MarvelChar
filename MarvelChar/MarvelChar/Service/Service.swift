//
//  Service.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireImage
import UIKit

class Service {
    func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let request = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T,AFError>) in
                
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    print(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func requestImage(URL: URL) -> Observable<Image> {
        return Observable<Image>.create { observer in
            
            let request = AF.request(URL, method: .get).responseImage(queue: .main) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    print(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
