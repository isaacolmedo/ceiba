//
//  Repository.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation

public protocol Repository {
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var urlComponents: URLComponents? { get }
    var url: URL? { get }
    var queryItems: [URLQueryItem]? { get }
}
