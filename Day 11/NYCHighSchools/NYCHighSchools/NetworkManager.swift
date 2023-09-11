//
//  NetworkManager.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/7/23.
//

import Foundation

class NetworkManager {
    func getData<T: Decodable>(urlString: String, type: T.Type, completionHandler: @escaping (Result<T, NetworkManagerError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlFailed))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let urlData = data else {
                completionHandler(.failure(.urlSessionFailed))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let dataDecoded = try jsonDecoder.decode(T.self, from: urlData)
                completionHandler(.success(dataDecoded))
            } catch {
                print(error)
                completionHandler(.failure(.dataDecodedFailed))
            }
        }
        dataTask.resume()
    }
}
