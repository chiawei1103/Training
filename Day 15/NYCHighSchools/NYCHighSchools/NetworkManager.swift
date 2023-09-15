//
//  NetworkManager.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/7/23.
//

import Foundation

protocol NetworkPortable {
    func getDataAsync<T: Decodable>(urlString: String, type: T.Type) async -> Result<T, NetworkManagerError>
}

class NetworkManager: NetworkPortable, JsonDecoder {
    func getDataAsync<T: Decodable>(urlString: String, type: T.Type) async -> Result<T, NetworkManagerError> {
        guard let url = URL(string: urlString) else {
            return .failure(.urlFailed)
        }
        
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(for: urlRequest)
            let jsonData = try await decoder(type: type.self, data: data)
            return .success(jsonData)
            
        } catch {
            if error is NetworkManagerError {
                return .failure(.dataDecodedFailed)
            } else {
                return .failure(.urlSessionFailed)
            }
        }
    }
}

protocol JsonDecoder {
    func decoder<T: Decodable>(type: T.Type, data:Data) async throws -> T
}

extension JsonDecoder {
    func decoder<T: Decodable>(type: T.Type, data:Data) async throws -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let jsonData = try jsonDecoder.decode(type.self, from: data)
            return jsonData
        } catch {
            throw NetworkManagerError.dataDecodedFailed
        }
    }
}
