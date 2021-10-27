//
//  Configurable.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 25.05.2021.
//

import Foundation

protocol Configurable {
    associatedtype DataType
    func configure(with datum: DataType)
}
