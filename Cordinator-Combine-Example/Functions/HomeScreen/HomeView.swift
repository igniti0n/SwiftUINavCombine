//
//  HomeView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation
import SwiftUI

struct HomeView: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var fetchedUsers: FetchedResults<User>
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text("User: \(user.name)")
                .onNavigation {
                    viewModel.openDetails(user: user)
                }
        }.onAppear() {
                viewModel.fetchUsers(usersFromDb: fetchedUsers)
        }
    }
}

