//
//  Beer.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, description, imageURL: String?
//    let brewersTips, tagline: String?
//    let foodParing: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageURL = "image_url"
//        case brewersTips = "brewers_tips"
//        case foodParing = "food_paring"
    }
}


