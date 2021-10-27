//
//  EndpointProtocol.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation
import Alamofire



public typealias Method = HTTPMethod
public typealias Headers = Alamofire.HTTPHeaders
//public typealias Parameters = [String: Any]


protocol EndpointProtocol {
    var baseUrl:URL? { get }
    var encoding: ParameterEncoding { get }
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
    var method:Method { get }
    var path: String { get }

}

extension EndpointProtocol {

    var baseUrl: URL? {
        return ServiceConstants.baseUrl
    }

    var encoding:ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default: return URLEncoding.default
        }
    }
    
    var headers: Headers? {
        return [:]
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
}
