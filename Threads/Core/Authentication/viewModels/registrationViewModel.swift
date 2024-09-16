//
//  registrationViewModel.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation

class registrationViewModel : ObservableObject{
    
    @Published var emailTF   = ""
    @Published var passTF    = ""
    @Published var fullNameTF = ""
    @Published var userNameTF = ""
    
    
    @MainActor
    func createUser() async throws {
        try await authServices.shared.createUser(firstName: fullNameTF, userName: userNameTF, email: emailTF, password: passTF)
    }
}
