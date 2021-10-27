//
//  FirstScreenEndpoint.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//



import Foundation

enum FirstScreenEndpoint: EndpointProtocol {
    
    case getComments
    
    var path: String {
        
        switch self {
        
        case .getComments:
        
            return API.baseUrl
        
        }
    }
    
    var method: Method {
        switch self {
        case .getComments:
            return .get
        }
    }
    
}
