//
//  PostResponseElement.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation

// MARK: - GetPostsResponseElement
public struct PostResponseElement: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
