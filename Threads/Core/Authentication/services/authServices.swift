//
//  authServices.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Firebase

class authServices{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared  = authServices()
    
    @MainActor
    
    func login(email: String , password: String) async throws{
        
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        
        try await userService.shared.fetchUserData()
        
        print("user data is here \(result.user.uid)")
        
    }
    
    func createUser(firstName: String , userName: String , email: String , password: String) async throws{
        do{
            
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
           try await uploadUserData(firstName: firstName, userName: userName, withEmail: email, password: password, id: result.user.uid)
            print("created user \(result.user.uid)")
            
        }catch{
            
            print("failed to create user \(error.localizedDescription)")
            
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        userService.shared.reset()
    }
    
    private func uploadUserData(firstName: String, userName: String, withEmail email: String, password: String, id: String) async throws {
        
        let user = User(id: id, fullName: firstName, email: email, userName: userName)
        
        // Ensure User conforms to Codable
        let encoder = JSONEncoder()
        guard let userData = try? encoder.encode(user),
              let dictionary = try? JSONSerialization.jsonObject(with: userData) as? [String: Any] else { return }
        
        // Upload data to Firestore
        try await Firestore.firestore().collection("users").document(id).setData(dictionary)
    }
    
//    private func uploadUsserData(firstName: String , userName: String ,withEmail email: String , password: String,id:String)async throws{
//          
//          let user = User(id: id, fullName: firstName, email: email, userName: userName)
//          guard let userData = try? Firestore.Encoder().encode(user) else { return }
//          try await
//          Firestore.firestore().collection("users").document(id).setData(userData)
//      }

}
