//
//  NetworUsersResponseSpy.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation
import Combine
@testable import Ceiba

class NetworUsersResponseSpy: Network {
    var fetchWasCalled = false
    func fetch<Response: Decodable>(repository: Repository) -> AnyPublisher<Response, Error> {
        self.fetchWasCalled = true
        return Future { promise in
            let result: Response = [UserDTO]() as! Response
            promise(.success(result))
        }.eraseToAnyPublisher()
    }
}
