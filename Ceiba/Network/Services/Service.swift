//
//  Service.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation
import Combine

protocol Service {
    var network: Network { get }
    func get<Response: Decodable>(repository: Repository, by userId: String) -> AnyPublisher<Response, Error>
    func get<Response: Decodable>(repository: Repository) -> AnyPublisher<Response, Error>
}

extension Service {
    func get<Response: Decodable>(repository: Repository, by userId: String) -> AnyPublisher<Response, Error> {
        return network.fetch(repository: repository)
    }

    func get<Response: Decodable>(repository: Repository) -> AnyPublisher<Response, Error> {
        return network.fetch(repository: repository)
    }
}
