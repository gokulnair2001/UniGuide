//
//  userProfile.swift
//  UniGuide
//
//  Created by Gokul Nair on 26/05/21.
//

import UIKit

struct profileModel: Codable {
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

