//
//  APIError.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation

enum APIError: Error, LocalizedError {

    case noBaseUrl
    case noNetwork
    case serverError(error: Error?, response: HTTPURLResponse?, data: Data?)
    case notAuthorized
    case decodingError
    case custom(_ error: String?)
    case parsableError(ParsableError)

}
