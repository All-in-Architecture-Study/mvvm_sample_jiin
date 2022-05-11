//
//  Repository.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation
import Alamofire

enum APIError: Error {
    case testError
}

protocol BeerListRepositoriable {
    func fetch(completionHandler: @escaping(Result<[Beer], Error>) -> ())
}

class BeerListErrorRepository: BeerListRepositoriable {
    func fetch(completionHandler: @escaping (Result<[Beer], Error>) -> ()) {
        completionHandler(.failure(APIError.testError))
    }
}

class Repository {
    func fetchBeerData(completionHandler: @escaping(Result<[Beer], Error>) -> ()) {
        //API 나누는 거 ?!
        //https://zeddios.tistory.com/1103
        AF.request("https://api.punkapi.com/v2/beers",
               method: .get,
               parameters: nil)
        .responseData { response in
            switch response.result {
            case let .success(data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Beer].self, from: data)
                    completionHandler(.success(result))
                    print("fetchBeerData - success")
                } catch {
                    completionHandler(.failure(error))
                }
            //에러 타입 케이스로 ,,
            case let .failure(error):
                print("ERROR \(error)")
            }
        }
    }
}
