//
//  ServiceConstants.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation

enum ServiceConstants {
    static let baseUrl = URL(string: "http://app.cre.ru/api8/PlayersPersonList")
    static let requestTimeout: TimeInterval = 10
    static let resourceTimeout: TimeInterval = 10
    static let validCodes = (200 ..< 300)
    static let limitOffset = 15
}
