//
//  EndpointRouter.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 07/02/23.
//

import Foundation
import Alamofire
import CryptoKit

enum AppCongfig: String {
    case baseURL = "https://gateway.marvel.com:443"
    case v1 = "/v1"
    case publicKeyPath = "/public"
    case publicKey = "78615c175e959268b26b574d80998e69"
    case privateKey = "bfb781f74705389ebf98315d152bd8c256af1070"
}

struct URLComponents {
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let json = "application/json"
    static let authentication = "Authorization"
    static let key = "Key"
    static let ts = String(Date().timeIntervalSince1970)
}

enum EndpointRouter: URLRequestConvertible {
    case getCharacters
    case getCharacter(_ id: Int)
    
    func asURLRequest() throws -> URLRequest {
        var url = try AppCongfig.baseURL.rawValue.asURL()
        url = url.appendingPathComponent(AppCongfig.v1.rawValue)
        url = url.appendingPathComponent(AppCongfig.publicKeyPath.rawValue)
        url = url.appendingPathComponent(path)
        url = url.appending(queryItems: [URLQueryItem(name: "ts", value: URLComponents.ts)])
        url = url.appending(queryItems: [URLQueryItem(name: "apikey", value: AppCongfig.publicKey.rawValue)])
        url = url.appending(queryItems: [URLQueryItem(name: "hash", value: hash)])
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(URLComponents.json, forHTTPHeaderField: URLComponents.contentType)
        urlRequest.setValue(URLComponents.json, forHTTPHeaderField: URLComponents.accept)
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: nil)
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getCharacters, .getCharacter(_):
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getCharacters:
            return "/characters"
        case .getCharacter(let id):
            return "/characters/\(id)"
        }
    }
    
    var hash: String {
        return (URLComponents.ts + AppCongfig.privateKey.rawValue + AppCongfig.publicKey.rawValue).toHash()
    }

}
