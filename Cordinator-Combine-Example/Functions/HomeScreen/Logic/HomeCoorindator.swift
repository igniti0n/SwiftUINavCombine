//
//  HomeCoorindator.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

class HomeCoordinator: ObservableObject {
    @Published var viewModel: HomeViewModel!
    @Published var detailsCoordinator: DetailsCoordinator?
    
    init() {
        viewModel = HomeViewModel(coordinator: self)
    }
}

extension HomeCoordinator {
    // MARK: - Navigation
    func openDetails(user: User) {
        detailsCoordinator = DetailsCoordinator(user: user)
    }
}
