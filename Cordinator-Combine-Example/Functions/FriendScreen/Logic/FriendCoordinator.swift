//
//  FriendCoordinator.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//

import Foundation

class FriendCooridnator: ObservableObject {
    @Published var viewModel: FriendViewModel!
    
    init(friend: FriendModel) {
        viewModel = FriendViewModel(coordinator: self,friend: friend)
    }
}
