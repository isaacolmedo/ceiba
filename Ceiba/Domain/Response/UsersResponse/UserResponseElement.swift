//
//  UserResponseElement.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation

// MARK: - UserResponseElement
public struct UserResponseElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}
