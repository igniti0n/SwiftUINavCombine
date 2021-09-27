//
//  DetailsViewModel.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

class DetailsViewModel: ObservableObject {
    @Published var user: UserModel
    
    unowned private let coordinator: DetailsCoordinator
    
    init(coordinator: DetailsCoordinator, user: UserModel) {
        self.coordinator = coordinator
        self.user = user
    }
}

extension DetailsViewModel {
    func openFriendScreen(friend: FriendModel) {
        coordinator.openFriendScreen(friend: friend)
    }
}
