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
    
    init(user: UserModel) {
        self.viewModel = DetailsViewModel(coordinator: self, user:  user)
    }
}

extension DetailsCoordinator {
    // MARK: - Navigation
    func openFriendScreen(friend: FriendModel) {
        friendCoordinator = FriendCooridnator(friend: friend)
    }
}
