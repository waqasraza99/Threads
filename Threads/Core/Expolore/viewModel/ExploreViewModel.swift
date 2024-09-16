//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Waqas Raza on 08/01/2024.
//

import Foundation

class ExploreViewModel: ObservableObject{
    
    @Published var Users = [User]()
    
    init() {
        Task{try await fetchUsers()}
    }
    
    func fetchUsers() async throws{
        self.Users = try await userService.fetchAllUsers()
    }
}
