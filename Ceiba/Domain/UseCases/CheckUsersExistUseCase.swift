//
//  CheckUsersExistUseCase.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 25/08/22.
//

import Foundation

final class CheckUsersExistUseCase: UseCase {

    typealias ResultValue = (Result<Bool, Error>)

    init() {
        
    }

    func start() -> ResultValue? {
        return .success(true)
    }
}




