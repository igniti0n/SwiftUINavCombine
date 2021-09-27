//
//  DetailsCoordinator.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

class DetailsCoordinator: ObservableObject {
    @Published var viewModel: DetailsViewModel!
    @Published var friendCoordinator: FriendCooridnator?
    
    init(user: User) {
        self.viewModel = DetailsViewModel(coordinator: self, user:  user)
    }
}

extension DetailsCoordinator {
    // MARK: - Navigation
    func openFriendScreen(friend: Friend) {
        friendCoordinator = FriendCooridnator(friend: friend)
    }
}
