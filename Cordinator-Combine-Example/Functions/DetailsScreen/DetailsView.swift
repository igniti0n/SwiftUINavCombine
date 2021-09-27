//
//  DtailsView.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//

import Foundation
import SwiftUI

struct DetaisView: View {
    @ObservedObject private var viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center
               , spacing: nil, content: {
                Text(viewModel.user.name)
                Text(viewModel.user.about)
                Text("Friends")
                List(viewModel.user.friends) { friend in
                    Text(friend.name)
                        .onNavigation {
                            viewModel.openFriendScreen(friend: friend)
                        }
                }
        })
    }
}
