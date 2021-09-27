//
//  RootCoordinatorView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation
import SwiftUI

struct RootCoordinatorView: View {
    @ObservedObject private var rootCooridnator: RootCoordinator
    
    init(coordinator: RootCoordinator) {
        self.rootCooridnator = coordinator
    }
    
    var body: some View {
        HomeCoorindatorView(coordinator: rootCooridnator.homeCooridnator)
    }
}
