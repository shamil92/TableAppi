//
//  Result.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation

typealias EmptyCompletion = (Result<Codable>) -> Void

enum Result<Model> {
  
  case success(Model)
  case failure(APIError)
  
  // Returns `true` if the result is a success, `false` otherwise.
  
  public var isSuccess: Bool {
    
    switch self {
    case .success:      return true
    case .failure:      return false
    }
  }
  
  // Returns `true` if the result is a failure, `false` otherwise.
  
  public var isFailure: Bool {
    return !isSuccess
  }
  
  // Returns the associated value if the result is a success, `nil` otherwise.
  
  public var value: Model? {
    
    switch self {
    case .success(let value):   return value
    case .failure:              return nil
    }
  }
  
  // Returns the associated error value if the result is a failure, `nil` otherwise.
  
  public var error: APIError? {
    
    switch self {
    case .success:              return nil
    case .failure(let error):   return error
    }
  }
}

