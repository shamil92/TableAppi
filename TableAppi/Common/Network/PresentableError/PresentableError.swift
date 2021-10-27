//
//  PresentableError.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation

protocol PresentableError where Self: Error {
  var userMessage: String { get }
  var isNetworkError: Bool { get }
}

extension APIError {
  var isNetworkError: Bool {
    switch self {
    case .noNetwork:    return true
    default:            return false
    }
  }
}
