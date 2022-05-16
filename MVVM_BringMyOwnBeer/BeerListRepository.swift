//
//  Repository.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case noData                 // 결과 데이터 미존재
    case failDecode             // Decode 실패
    case noURL                 // URL 존재하지 않음
}

protocol BeerRepositoriable {
    func fetch(page: Int?, completionHandler: @escaping(Result<[Beer], Error>) -> ())
}

class BeerListRepository: BeerRepositoriable {
    func fetch(page: Int?, completionHandler: @escaping(Result<[Beer], Error>) -> ()) {

        guard let url = makeGetBeersComponents(page: page).url else {
            return completionHandler(.failure(NetworkError.noURL)) //Url이 존재하지 않을 때
        }
        AF.request(url,
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
                    completionHandler(.failure(NetworkError.failDecode))
                }
            case let .failure(error):
                print("ERROR \(error)") //진짜 실패 
            }
        }
    }
}

private extension BeerListRepository {
    struct BeerAPI {
        static let scheme = "https"
        static let host = "api.punkapi.com"
        static let path = "/v2/beers"
    }
    
    func makeGetBeersComponents(page: Int?) -> URLComponents {
        var components = URLComponents()
        components.scheme = BeerAPI.scheme
        components.host = BeerAPI.host
        components.path = BeerAPI.path
        if let page = page {
            components.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "40")
            ]
        } else {
            components.queryItems = [
                URLQueryItem(name: "per_page", value: "40")
            ]
        }
        
        return components
    }
}
