//
//  DetailsCoordinatorView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import SwiftUI

struct DetailsCoordinatorView: View {
    @ObservedObject private var coordinator: DetailsCoordinator
    
    init(coordinator: DetailsCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        DetaisView(viewModel: coordinator.viewModel)
            .navigation(item: $coordinator.friendCoordinator) { friendCoordinator in
                FriendCoordinatorView(coordinator: friendCoordinator)
            }
    }
}

