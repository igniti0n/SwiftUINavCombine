//
//  HomeViewModel.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation
import SwiftUI
import CoreData
import Combine

class HomeViewModel: ObservableObject {
    @Published var users = Array<UserModel>()
    
    unowned private var coordinator: HomeCoordinator
    private var cancaelablesSet = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}

extension HomeViewModel {
    // MARK: - Navigation
    func openDetails(user: UserModel) {
        coordinator.openDetails(user: user)
    }
}

extension HomeViewModel {
    // MARK: - Private methods
    func fetchUsers(usersFromDb: FetchedResults<User>) -> Void {
        
        if !users.isEmpty {return}
        
        if let fetchedUsersFromDatabase = mapFromDatabase(usersFromDatabase: usersFromDb) {
            users = fetchedUsersFromDatabase
            print("Got users from database: \(fetchedUsersFromDatabase)")
            return
        }
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ (data: Data, response: URLResponse) in
                guard
                    let response = response as? HTTPURLResponse,
                    (200...299).contains( response.statusCode) == true
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            })
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { failure in
                print("Data task completed: \(failure)")
            } receiveValue: {  [weak self] output in
                print("users: \(output.count)")
                self?.users.append(contentsOf: output)
                self?.saveUsersToDatabase(users: output)
            }
            .store(in: &cancaelablesSet)
        
    }
}

private extension HomeViewModel {
    // MARK: - Database operations
    func mapFromDatabase(usersFromDatabase: FetchedResults<User>) -> [UserModel]? {
        let usersFromDatabase = usersFromDatabase.map { user in
            return UserModel(id: user.id ?? "", name: user.name ?? "unknown", about: user.about ?? "nothing", friends: user.wrappedFriends)
        }
        print("FETCHED USERS FORM DB: \(usersFromDatabase.count)")
        return usersFromDatabase.isEmpty ? nil : usersFromDatabase
    }
    
    func saveUsersToDatabase(users: [UserModel]) {
        for user in users {
            let newUser = User(context: PersistenceController.shared.container.viewContext)
            newUser.name = user.name
            newUser.id = user.id
            newUser.about = user.about
            
            for friend in user.friends {
                newUser.friends?.adding(friend)
            }
        }
        
        PersistenceController.shared.save()
        
    }
}
