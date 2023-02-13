//
//  GoogleEndpointRouter.swift
//  MarvelChar
//
//  Created by Leonardo Soares on 12/02/23.
//

import Foundation
import Alamofire

enum GoogleEndpointRouter: URLRequestConvertible {
    case getBooks
    
    func asURLRequest() throws -> URLRequest {
        var url = try GoogleApi.baseURL.asURL()
        url = url.appendingPathComponent(path)
        url = url.appendingPathComponent(apiVersion)
        url = url.appendingPathComponent(subject)
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(URLComponents.json, forHTTPHeaderField: URLComponents.contentType)
        urlRequest.setValue(URLComponents.json, forHTTPHeaderField: URLComponents.accept)
        urlRequest.setValue(AppCongfig.googleApiKey, forHTTPHeaderField: URLComponents.key)
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    private var subject: String {
        switch self {
        case .getBooks:
            return "/volumes"
        }
    }
    
    private var apiVersion: String {
        switch self {
        case .getBooks:
            return "/v1"
        }
    }
    
    private var path: String {
        switch self {
        case .getBooks:
            return "/books"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getBooks:
            return .get
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getBooks:
            var params = ["q" : "marvel books"]
            params["maxResults"] = "10"
            return params
        }
    }
}
