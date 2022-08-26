//
//  CeibaUserStorage.swift
//  Ceiba
//
//  Created by Miguel Olmedo on 25/08/22.
//

import Foundation
import CoreData
import Combine

final class CeibaUserStorage {

    private let storage: CeibaStorage

    init(storage: CeibaStorage = CeibaStorage.shared) {
        self.storage = storage
    }

    // MARK: - Private

    private func cleanUpUsers(for user: UserDTO, inContext context: NSManagedObjectContext) throws {
        let request: NSFetchRequest = UserEntity.fetchRequest()
        var result = try context.fetch(request)
        removeDuplicates(for: user, in: &result, inContext: context)
    }

    private func removeDuplicates(for user: UserDTO, in users: inout [UserEntity], inContext context: NSManagedObjectContext) {
        users
            .filter { $0.id == user.id }
            .forEach { context.delete($0) }
        users.removeAll { $0.id == user.id }
    }

    private func removeUsers(users: [UserEntity], inContext context: NSManagedObjectContext) {
        users.forEach { context.delete($0) }
    }
}

extension CeibaUserStorage: UserStorage {
    func getResponse() -> Future<[UserDTO], CeibaStorageError> {
        return Future { promise in
            self.storage.performBackgroundTask { context in
                do {
                    let request: NSFetchRequest = UserEntity.fetchRequest()
                    let sort = NSSortDescriptor(key: "id",
                                                ascending: true,
                                                selector: #selector(NSString.localizedStandardCompare(_:)))
                    request.sortDescriptors = [sort]
                    let result = try context.fetch(request).compactMap { $0.toDTO() }
                    promise(.success(result))
                } catch {
                    promise(.failure(CeibaStorageError.readError(error)))
                }
            }
        }
    }

    func save(user: UserDTO) -> Future<UserDTO, CeibaStorageError> {
        return Future { promise in
            self.storage.performBackgroundTask { [weak self] context in
                guard let self = self else { return }
                do {
                    try self.cleanUpUsers(for: user, inContext: context)
                    let entity = user.toEntity(in: context)
                    try context.save()
                    guard let dto = entity.toDTO() else {
                        promise(.failure(.mappingError))
                        return
                    }
                    promise(.success(dto))
                } catch {
                    promise(.failure(.saveError(error)))
                }
            }
        }
    }

    func save(users: [UserDTO]) -> Future<[UserDTO], CeibaStorageError> {
        return Future { promise in
            self.storage.performBackgroundTask { [weak self] context in
                guard let self = self else { return }
                do {
                    _ = try users.map { try self.cleanUpUsers(for: $0, inContext: context) }
                    let dtos = users.compactMap { $0.toEntity(in: context).toDTO() }
                    try context.save()
                    promise(.success(dtos))
                } catch {
                    promise(.failure(.saveError(error)))
                }
            }
        }
    }
}
