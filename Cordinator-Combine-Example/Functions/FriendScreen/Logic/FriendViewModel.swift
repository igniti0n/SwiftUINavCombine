//
//  FriendViewModel.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//

import Foundation

class FriendViewModel: ObservableObject {
    @Published var friend: Friend!
    
    unowned private let coordinator: FriendCooridnator
    
    init(coordinator: FriendCooridnator, friend: Friend) {
        self.friend = friend
        self.coordinator = coordinator
    }
}
