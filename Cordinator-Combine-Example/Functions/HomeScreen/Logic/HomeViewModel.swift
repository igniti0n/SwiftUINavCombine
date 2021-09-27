//
//  HomeViewModel.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 26.09.2021..
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var users = Array<User>()
    
    unowned private var coordinator: HomeCoordinator
    private var cancaelablesSet = Set<AnyCancellable>()
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        fetchUsers()
    }
}

extension HomeViewModel {
    // MARK: - Navigation
    func openDetails(user: User) {
        coordinator.openDetails(user: user)
    }
}

private extension HomeViewModel {
    // MARK: - Private methods
    func fetchUsers() {
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
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { failure in
                print("Data task completed: \(failure)")
            } receiveValue: {  [weak self] output in
                print("users: \(output.count)")
                self?.users.append(contentsOf: output)
            }
            .store(in: &cancaelablesSet)

    }
}
