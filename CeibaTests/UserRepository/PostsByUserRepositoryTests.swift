//
//  PostsByUserRepositoryTests.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import XCTest
@testable import Ceiba

class PostsByUserRepositoryTests: XCTestCase {

    let path = "/posts"
    let queryPath = "/posts?userId=1"
    let baseUrl = "https://jsonplaceholder.typicode.com"
    var urlComponents: URLComponents? {
        URLComponents(string: "\(baseUrl)\(queryPath)")
    }

    func test_base_url() {
        let sut = UserRepository.post(user: "1")
        
        XCTAssertEqual(sut.baseURL, baseUrl)
    }

    func test_path() {
        let sut = UserRepository.post(user: "1")
        
        XCTAssertEqual(sut.path, path)
    }

    func test_method() {
        let sut = UserRepository.post(user: "1")
        let method = HTTPMethod.get
        
        XCTAssertEqual(sut.method, method)
    }

    func test_urlComponents() {
        let sut = UserRepository.post(user: "1")
        
        XCTAssertEqual(sut.urlComponents, urlComponents)
    }

    func test_url() {
        let sut = UserRepository.post(user: "1")
        
        XCTAssertEqual(sut.url, urlComponents?.url)
    }

    func test_queryItems() {
        let sut = UserRepository.post(user: "1")
        
        let query = URLQueryItem(name: "userId", value: "1")
        XCTAssertEqual(sut.queryItems, [query])
    }
}
