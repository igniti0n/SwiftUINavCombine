//
//  User.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

class User: Codable, Identifiable {
    let id: String
    let name: String
    let about: String
    let friends: [Friend]
}

class Friend: Codable, Identifiable {
    let id: String
    let name: String
}
