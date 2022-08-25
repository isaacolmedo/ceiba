//
//  UseCase.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 25/08/22.
//

import Foundation

public protocol UseCase {
    associatedtype ResultValue
    @discardableResult
    func start() -> ResultValue?
}
