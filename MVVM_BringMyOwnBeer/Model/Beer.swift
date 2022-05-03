//
//  Beer.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/03.
//

import Foundation

struct BeerList: Decodable {
    let beers: [Beer]
}

struct Beer: Decodable {
    let id: Int?
    let name, description, image_url: String?
}
