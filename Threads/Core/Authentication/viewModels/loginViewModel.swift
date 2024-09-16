//
//  loginViewModel.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation

class loginViewModel : ObservableObject {
    
    @Published var emailTF   = "Waqasrazq@gmail.com"
    @Published var passTF    = "123456"
   
    
    @MainActor
    func login() async throws {
        try await authServices.shared.login(email: emailTF, password: passTF)
    }
}
