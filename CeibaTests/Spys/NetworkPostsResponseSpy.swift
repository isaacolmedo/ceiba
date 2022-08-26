//
//  NetworkPostsResponseSpy.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation
import Ceiba
import Combine

class NetworkPostsResponseSpy: Network {
    var fetchWasCalled = false
    func fetch<Response: Decodable>(repository: Repository) -> AnyPublisher<Response, Error> {
        self.fetchWasCalled = true
        return Future { promise in
            let result: Response = Posts() as! Response
            promise(.success(result))
        }.eraseToAnyPublisher()
    }
}
