//
//  NetworkManagerClosure.swift
//  CountryList
//
//  Created by Lawrence on 9/5/23.
//

import Foundation

enum NetworkError: Error {
    case urlParseFailed
    case urlSessionFailed
    case jsonDecoderFailed
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .urlParseFailed:
            return NSLocalizedString("URL Parsing Failed", comment: "")
        case .urlSessionFailed:
            return NSLocalizedString("URL Session Failed", comment: "")
        case .jsonDecoderFailed:
            return NSLocalizedString("JSON Decoder Failed", comment: "")
        }
    }
}

class NetworkManagerClosure {
    func getCountry(completionHandler: @escaping (Result<[Country], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            return completionHandler(.failure(.urlParseFailed))
        }
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in

            guard let data = data, error == nil else {
                return completionHandler(.failure(.urlSessionFailed))
            }

            let decoder = JSONDecoder()
            do {
                let countries = try decoder.decode([Country].self, from: data)
                return completionHandler(.success(countries))
            } catch {
                return completionHandler(.failure(.jsonDecoderFailed))
            }
        }
        dataTask.resume()
    }
    
//    func getCountry(completionHandler: @escaping ([Country]?, Error?) -> Void) {
//        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
//
//        let urlRequest = URLRequest(url: url)
//
//        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
//
//        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
//
//            guard let data = data, error == nil else {
//                return completionHandler(nil, error)
//            }
//
//            let decoder = JSONDecoder()
//            do {
//                let countries = try decoder.decode([Country].self, from: data)
//                completionHandler(countries, nil)
//            } catch {
//                return completionHandler(nil, error)
//            }
//        }
//        dataTask.resume()
//    }
    
}
