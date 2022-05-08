//
//  Service.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation

class Service {
    let repository = Repository()
    
    var beerModel = [BeerModel]() //state
    
    func beerToBeerModel(from: [Beer]) -> [BeerModel] {
        var result = [BeerModel]()
        from.forEach {
            result.append(BeerModel(id: $0.id!, name: $0.name!, description: $0.description!, imageURL: $0.imageURL!))
        }
        return result
    }
    
    func fetchBeerList(onCompleted: @escaping ([BeerModel]) -> Void) {
        
        //Entity -> Model
        repository.fetchBeerData { [weak self] result in
            switch result {
            case let .success(result):
                //Beer 데이터 리스트 그냥 그대로 보임,, 이를 -> 필요한 데이터들만 받아야함
                //데이터 재가공해야됨,,
                print("success - Service(fetchBeerList)")
                guard let modelData = self?.beerToBeerModel(from: result) else { return }
                self?.beerModel = modelData
                onCompleted(modelData)
            case let .failure(error):
                debugPrint("error: \(error)")
            }
        }
    }

}
