//
//  UserResponseDTO+Mapping.swift
//  Ceiba
//
//  Created by Miguel Olmedo on 25/08/22.
//

import Foundation

typealias UsersDTO = [UserDTO]

// MARK: - UserDTO
struct UserDTO: Decodable, Equatable {
    let id: Int
    let name, username, email: String
    let address: AddressDTO
    let phone, website: String
    let company: CompanyDTO
    static func ==(lhs: UserDTO, rhs: UserDTO) -> Bool {
        return lhs.id == rhs.id
    }
}


// MARK: - AddressDTO
struct AddressDTO: Decodable {
    let street, suite, city, zipcode: String
    let geo: GeoDTO
}

// MARK: - GeoDTO
struct GeoDTO: Decodable {
    let lat, lng: String
}

// MARK: - CompanyDTO
struct CompanyDTO: Decodable {
    let name, catchPhrase, bs: String
}

// MARK: - DTO to Domain

extension UserDTO {
    func toDomain() -> User {
        return .init(id: id,
                     name: name,
                     username: username,
                     email: email,
                     address: address.toDomain(),
                     phone: phone,
                     website: website,
                     company: company.toDomain())
    }
}

extension AddressDTO {
    func toDomain() -> Address {
        return .init(street: street,
                     suite: suite,
                     city: city,
                     zipcode: zipcode,
                     geo: geo.toDomain())
    }
}

extension GeoDTO {
    func toDomain() -> Geo {
        return .init(lat: lat,
                     lng: lng)
    }
}

extension CompanyDTO {
    func toDomain() -> Company {
        return .init(name: name,
                     catchPhrase: catchPhrase,
                     bs: bs)
    }
}
