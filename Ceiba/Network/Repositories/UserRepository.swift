//
//  UserRepository.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation

enum UserRepository: Repository {
    case users
    case posts
    case post(user: String)

    var baseURL: String {
        "https://jsonplaceholder.typicode.com"
    }

    var path: String {
        switch self {
            case .users:
                return "/users"
            case .posts:
                return "/posts"
            case .post:
                return "/posts"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var urlComponents: URLComponents? {
        var urlComponents = URLComponents(string: "\(baseURL)\(path)")
        urlComponents?.queryItems = queryItems
        return urlComponents
    }

    var url: URL? {
        urlComponents?.url
    }

    var queryItems: [URLQueryItem]? {
        guard case let .post(userId) = self else {
            return nil
        }
        return [URLQueryItem(name: "userId", value: userId)]
    }
}
