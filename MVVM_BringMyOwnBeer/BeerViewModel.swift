//
//  BeerViewModel.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation
import RxRelay
import RxSwift

//ViewModel은 Model을 소유
//View에 대한 정보 없이 비즈니스 로직만,,
class BeerViewModel {
    
    let beerModelData = BehaviorRelay(value: [Beer]())
    let service = BeerListService(BeerListSuccessRepository() as BeerListRepositoriable)
    
    func reload() {
        service.fetchBeerList { [weak self] result in
            guard let self = self else { return }
            self.beerModelData.accept(result)
        }
    }
}
