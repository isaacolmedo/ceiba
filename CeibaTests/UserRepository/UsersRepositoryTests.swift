//
//  UserRepositoryTests.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import XCTest
@testable import Ceiba

class UsersRepositoryTests: XCTestCase {

    let path = "/users"
    let baseUrl = "https://jsonplaceholder.typicode.com"
    var urlComponents: URLComponents? {
        URLComponents(string: "\(baseUrl)\(path)")
    }

    func test_base_url() {
        let sut = UserRepository.users
        
        XCTAssertEqual(sut.baseURL, baseUrl)
    }

    func test_path() {
        let sut = UserRepository.users
        
        XCTAssertEqual(sut.path, path)
    }

    func test_method() {
        let sut = UserRepository.users
        let method = HTTPMethod.get
        
        XCTAssertEqual(sut.method, method)
    }

    func test_urlComponents() {
        let sut = UserRepository.users
        
        XCTAssertEqual(sut.urlComponents, urlComponents)
    }

    func test_url() {
        let sut = UserRepository.users
        
        XCTAssertEqual(sut.url, urlComponents?.url)
    }

    func test_queryItems() {
        let sut = UserRepository.users
        
        XCTAssertEqual(sut.queryItems, nil)
    }
}
