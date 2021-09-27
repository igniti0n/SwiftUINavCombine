//
//  FriendCoordinatorView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//

import Foundation
import SwiftUI

struct FriendCoordinatorView: View {
    @ObservedObject private var coordinator: FriendCooridnator
    
    init(coordinator: FriendCooridnator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        FriendView(viewModel: coordinator.viewModel)
    }
}
