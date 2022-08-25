//
//  Post.swift
//  Ceiba
//
//  Created by Isaac Olmedo on 22/08/22.
//

import Foundation

// MARK: - Post
public struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
