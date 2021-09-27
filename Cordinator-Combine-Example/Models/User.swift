//
//  User.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: String
    let name: String
    let about: String
    let friends: [FriendModel]
}

struct FriendModel: Codable, Identifiable {
    let id: String
    let name: String
}
