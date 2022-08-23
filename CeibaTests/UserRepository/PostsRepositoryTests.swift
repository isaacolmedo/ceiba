//
//  PostsRepositoryTests.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import XCTest
@testable import Ceiba

class PostsRepositoryTests: XCTestCase {

    let path = "/posts"
    let baseUrl = "https://jsonplaceholder.typicode.com"
    var urlComponents: URLComponents? {
        URLComponents(string: "\(baseUrl)\(path)")
    }

    func test_base_url() {
        let sut = UserRepository.posts
        
        XCTAssertEqual(sut.baseURL, baseUrl)
    }

    func test_path() {
        let sut = UserRepository.posts
        
        XCTAssertEqual(sut.path, path)
    }

    func test_method() {
        let sut = UserRepository.posts
        let method = HTTPMethod.get
        
        XCTAssertEqual(sut.method, method)
    }

    func test_urlComponents() {
        let sut = UserRepository.posts
        
        XCTAssertEqual(sut.urlComponents, urlComponents)
    }

    func test_url() {
        let sut = UserRepository.posts
        
        XCTAssertEqual(sut.url, urlComponents?.url)
    }

    func test_queryItems() {
        let sut = UserRepository.posts
        
        XCTAssertEqual(sut.queryItems, nil)
    }
}
