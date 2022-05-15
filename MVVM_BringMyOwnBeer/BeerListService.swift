//
//  Service.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation

class BeerListService {
    let repository: BeerListRepositoriable
    var beerModel = [Beer]() //state
    
    init(_ repository: BeerListRepositoriable) {
        self.repository = repository
    }
    
    func fetchBeerList(onCompleted: @escaping ([Beer]) -> Void) {
        //Entity -> Model
        repository.fetch(page: 2) { [weak self] result in
            switch result {
            case let .success(result):
                self?.beerModel = result
                onCompleted(result)
            case let .failure(error):
                debugPrint("error: \(error)")
            }
        }
    }

}
