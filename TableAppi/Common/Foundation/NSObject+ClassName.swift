//
//  NSObject+ClassName.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 26.05.2021.
//


import Foundation

extension NSObject {
  
  static var className: String {
    return String(describing: self)
  }
  var className: String {
    return String(describing: type(of: self))
  }
}
