//
//  NetworUsersResponseSpy.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation
import Ceiba
import Combine

class NetworUsersResponseSpy: Network {
    var fetchWasCalled = false
    func fetch<Response: Codable>(repository: Repository) -> AnyPublisher<Response, Error> {
        self.fetchWasCalled = true
        return Future { promise in
            let result: Response = Users() as! Response
            promise(.success(result))
        }.eraseToAnyPublisher()
    }
}
