//
//  Repository.swift
//  MVVM_BringMyOwnBeer
//
//  Created by 김지인 on 2022/05/08.
//

import Foundation
import Alamofire

enum APIError: Error {
    case urlError(String)
    case fetchError
}

protocol BeerListRepositoriable {
    func fetch(page: Int?, completionHandler: @escaping(Result<[Beer], Error>) -> ())
}

class BeerListErrorRepository: BeerListRepositoriable {
    func fetch(page: Int?, completionHandler: @escaping (Result<[Beer], Error>) -> ()) {
        completionHandler(.failure(APIError.fetchError))
    }
}

class BeerListSuccessRepository: BeerListRepositoriable {
    func fetch(page: Int?, completionHandler: @escaping(Result<[Beer], Error>) -> ()) {

        guard let url = makeGetBeersComponents(page: page).url else {
            let error = APIError.urlError("유효하지 않은 URL 입니다.")
            return completionHandler(.failure(error))
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
                    completionHandler(.failure(error))
                }
            //에러 타입 케이스로 ,,
            case let .failure(error):
                print("ERROR \(error)")
            }
        }
    }
}

private extension BeerListSuccessRepository {
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
