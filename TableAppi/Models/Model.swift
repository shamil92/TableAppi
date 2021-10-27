//
//  Model.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 06.05.2021.
//

import UIKit


// MARK: - Welcome
struct WelcomeElement: Decodable {
    let error: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Decodable {

    let id:Int?
    let fio:String?
    let sex:String?
    let post:String?
    let company:String?
    let actualCompany: Int?
    let activity: String?
    let photo: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fio = "fio"
        case sex = "sex"
        case post = "post"
        case company = "company"
        case actualCompany = "actual_company"
        case activity = "activity"
        case photo = "photo"
    }
}
