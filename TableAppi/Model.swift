//
//  Model.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 06.05.2021.
//

import Foundation


//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//
//    let quoteID: Int
//    let quote: String
//    let author: String
//    let series: String
//
//    enum CodingKeys: String, CodingKey {
//        case quoteID = "quote_id"
//        case quote = "quote"
//        case author = "author"
//        case series = "series"
//    }
//}
//
////enum Series: String, Codable {
////    case betterCallSaul = "Better Call Saul"
////    case breakingBad = "Breaking Bad"
////}
//
//typealias Welcome = [WelcomeElement]





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



