//
//  CoreDataUserTests.swift
//  CeibaTests
//
//  Created by Miguel Olmedo on 25/08/22.
//

import XCTest
import Combine
@testable import Ceiba

class CoreDataUserTests: XCTestCase {
    
    var bag = Set<AnyCancellable>()

    func test_saveUser() async throws {
        let sut = makeSut()
        let mock = makeMockUser()

        let result = try await sut.save(user: mock).eraseToAnyPublisher().async()
        
        XCTAssertTrue(result == mock)
    }

    func test_getAllUSer_whenSaveSameUSer() async throws {
        let sut = makeSut()
        let mock = makeMockUser()

        let saveResult = try await sut.save(user: mock).eraseToAnyPublisher().async()
        let getResult = try await sut.getResponse().eraseToAnyPublisher().async()
        XCTAssertTrue(saveResult == getResult.first)
    }

    func makeMockUser() -> UserDTO {
        let geo = GeoDTO(lat: "", lng: "")
        let address = AddressDTO(street: "", suite: "", city: "", zipcode: "", geo: geo)
        let company = CompanyDTO(name: "", catchPhrase: "", bs: "")
        let mock = UserDTO(id: 0, name: "", username: "", email: "", address: address, phone: "", website: "", company: company)
        return mock
    }

    func makeSut() -> UserStorage {
        let storage = CeibaStorage.shared
        let sut = CeibaUserStorage(storage: storage)
        return sut
    }
}
