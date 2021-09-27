//
//  HomeCoorindatorView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import SwiftUI

struct HomeCoorindatorView: View {
    @ObservedObject private var homeCoordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.homeCoordinator = coordinator
    }
    
    var body: some View {
        NavigationView {
            HomeView(viewModel: homeCoordinator.viewModel)
                .navigation(item:  $homeCoordinator.detailsCoordinator) { detailsCoordinator in
                    DetailsCoordinatorView(coordinator: detailsCoordinator)
                }
        }
    }

}
