//
//  Network.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation
import Combine

public protocol Network {
    func fetch<Response: Codable>(repository: Repository) -> AnyPublisher<Response, Error>
}

extension Network {
    func fetch<Response: Codable>(repository: Repository) -> AnyPublisher<Response, Error> {
        guard let url = repository.url else {
            debugPrint("Is not a URL \(repository.baseURL)\(repository.path)")
            return PassthroughSubject<Response, Error>().eraseToAnyPublisher()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = repository.method.rawValue
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
