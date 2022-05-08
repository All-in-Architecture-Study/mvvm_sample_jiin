//
//  Repository.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation
import Alamofire

class Repository {
    func fetchBeerData(completionHandler: @escaping(Result<[Beer], Error>) -> ()) {
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
            case let .failure(error):
                print("ERROR \(error)")
            }
        }
    }
}
