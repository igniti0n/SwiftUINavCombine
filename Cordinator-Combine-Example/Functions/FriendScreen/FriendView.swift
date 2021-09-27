//
//  FriendView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//

import Foundation
import SwiftUI

struct FriendView: View {
    @ObservedObject private var viewModel: FriendViewModel
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("\(viewModel.friend.name)")
            
    }
}
