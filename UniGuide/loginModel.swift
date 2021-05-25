//
//  loginModel.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit

struct loginModel: Decodable {
    let user: User
    let token: String
}

// MARK: - User
struct User: Decodable {
    let age: Int
    let id, name, email, createdAt: String
    let updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case age
        case id = "_id"
        case name, email, createdAt, updatedAt
        case v = "__v"
    }
}
