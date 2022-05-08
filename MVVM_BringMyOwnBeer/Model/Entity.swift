//
//  Beer.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import Foundation

//struct BeerList: Decodable {
//    let beerList: [Beer]
//}

struct Beer: Decodable {
    let id: Int?
    let name, tagline, description, brewersTips, contributedBy, imageURL: String?
    let firstBrewed: Date
    let abv, ibu, targetFG, targetOG, ebc, srm, ph, attenuationLevel: Double?
    let volume: Volume?
    let boilVolume: BoilVolume?
    let foodParing: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline, description, abv, ibu, ebc, srm, ph, volume
        case firstBrewed = "first_brewed"
        case imageURL = "image_url"
        case targetFG = "target_fg"
        case targetOG = "target_og"
        case attenuationLevel = "attenuation_level"
        case boilVolume = "boil_volume"
        case foodParing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

struct Volume: Codable {
    let value: Int
    let unit: String
}

struct BoilVolume: Codable {
    let value: Int
    let unit: String
}

