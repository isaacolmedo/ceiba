//
//  UserStorage.swift
//  Ceiba
//
//  Created by Miguel Olmedo on 25/08/22.
//

import Foundation
import Combine

protocol UserStorage {
    func getResponse() -> Future<UsersDTO, CeibaStorageError>
    func save(user: UserDTO) -> Future<UserDTO, CeibaStorageError>
    func save(users: [UserDTO]) -> Future<[UserDTO], CeibaStorageError>
}
