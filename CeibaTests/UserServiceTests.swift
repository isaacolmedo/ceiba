//
//  UserServiceTests.swift
//  CeibaTests
//
//  Created by Isaac Olmedo on 22/08/22.
//

import XCTest
import Combine
@testable import Ceiba

class UserServiceTests: XCTestCase {

    var bag = Set<AnyCancellable>()

    func test_get_all_posts_fetched() {
        let network = NetworkPostsResponseSpy()
        let sut = UserAPI(network: network)
        let repository: Repository = UserRepository.posts
        let expectation = expectation(description: "get posts response")

        sut.get(repository: repository)
            .replaceError(with: [])
            .sink { (response: GetPostsResponse) in
                expectation.fulfill()
            }.store(in: &bag)

        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(network.fetchWasCalled)
    }

    func test_get_all_users_fetched() {
        let network = NetworUsersResponseSpy()
        let sut = UserAPI(network: network)
        let repository: Repository = UserRepository.users
        let expectation = expectation(description: "get posts response")

        sut.get(repository: repository)
            .replaceError(with: [])
            .sink { (response: GetUsersResponse) in
                expectation.fulfill()
            }.store(in: &bag)

        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(network.fetchWasCalled)
    }
}
