//
//  UserEntity+Mapping.swift
//  Ceiba
//
//  Created by Miguel Olmedo on 25/08/22.
//

import Foundation
import CoreData

// MARK: - Entity To DOMAIN

extension UserEntity: Domainable {
    func toDomain() -> User? {
        guard let name = name,
              let username = username,
              let email = email,
              let address = address?.toDomain(),
              let phone = phone,
              let website = website,
              let company = company?.toDomain() else { return nil }
        return .init(id: Int(id),
                     name: name,
                     username: username,
                     email: email,
                     address: address,
                     phone: phone,
                     website: website,
                     company: company)
    }
}

extension CompanyEntity: Domainable {
    func toDomain() -> Company? {
        guard let name = name, let catchPhrase = catchPhrase, let bs = bs else { return nil }
        return .init(name: name, catchPhrase: catchPhrase, bs: bs)
    }
}

extension AddressEntity: Domainable {
    func toDomain() -> Address? {
        guard let street = street, let suite = suite, let city = city, let zipcode = zipcode, let geo = geo?.toDomain() else { return nil }
        return .init(street: street, suite: suite, city: city, zipcode: zipcode, geo: geo)
    }
}

extension GeoEntity: Domainable {
    func toDomain() -> Geo? {
        guard let lat = lat, let lng = lng else { return nil }
        return .init(lat: lat, lng: lng)
    }
}

protocol Domainable {
    associatedtype T
    func toDomain() -> T?
}

// MARK: - Entity To DTO

extension UserEntity {
    func toDTO() -> UserDTO? {
        guard let name = name,
              let username = username,
              let email = email,
              let address = address?.toDTO(),
              let phone = phone,
              let website = website,
              let company = company?.toDTO() else { return nil }
        return .init(id: Int(id),
                     name: name,
                     username: username,
                     email: email,
                     address: address,
                     phone: phone,
                     website: website,
                     company: company)
    }
}

extension CompanyEntity {
    func toDTO() -> CompanyDTO? {
        guard let name = name, let catchPhrase = catchPhrase, let bs = bs else { return nil }
        return .init(name: name, catchPhrase: catchPhrase, bs: bs)
    }
}

extension AddressEntity {
    func toDTO() -> AddressDTO? {
        guard let street = street, let suite = suite, let city = city, let zipcode = zipcode, let geo = geo?.toDTO() else { return nil }
        return .init(street: street, suite: suite, city: city, zipcode: zipcode, geo: geo)
    }
}

extension GeoEntity {
    func toDTO() -> GeoDTO? {
        guard let lat = lat, let lng = lng else { return nil }
        return .init(lat: lat, lng: lng)
    }
}

// MARK: - TDO To Entity

extension UserDTO {
    func toEntity(in context: NSManagedObjectContext) -> UserEntity {
        let entity: UserEntity = .init(context: context)
        entity.id = Int32(id)
        entity.name = name
        entity.username = username
        entity.email = email
        entity.address = address.toEntity(in: context)
        entity.phone = phone
        entity.website = website
        entity.company = company.toEntity(in: context)
        return entity
    }
}

extension AddressDTO {
    func toEntity(in context: NSManagedObjectContext) -> AddressEntity {
        let entity: AddressEntity = .init(context: context)
        entity.street = street
        entity.suite = suite
        entity.city = city
        entity.zipcode = zipcode
        entity.geo = geo.toEntity(in: context)
        return entity
    }
}

extension GeoDTO {
    func toEntity(in context: NSManagedObjectContext) -> GeoEntity {
        let entity: GeoEntity = .init(context: context)
        entity.lat = lat
        entity.lng = lng
        return entity
    }
}

extension CompanyDTO {
    func toEntity(in context: NSManagedObjectContext) -> CompanyEntity {
        let entity: CompanyEntity = .init(context: context)
        entity.name = name
        entity.catchPhrase = catchPhrase
        entity.bs = bs
        return entity
    }
}
