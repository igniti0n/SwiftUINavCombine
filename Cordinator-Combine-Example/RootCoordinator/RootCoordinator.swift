//
//  RootCoordinator.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation

class RootCoordinator: ObservableObject {
    @Published var homeCooridnator = HomeCoordinator()
}
