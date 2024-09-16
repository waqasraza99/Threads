//
//  userServices.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

class userService{
    
    @Published var currentUser : User?
    static let shared = userService()
    
    init(){
        Task{try await fetchUserData()}
    }
    
    func fetchUserData()async throws{
        //        print("user data ")
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        print("kashi khan\(uid)")
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        print("kashi khan , aftab\(snapshot["email"])")
        
        do{
            let user = try? snapshot.data(as: User.self)
            self.currentUser = user
            
            print("user data \(user)")
        }catch{
            
            print("err",error.localizedDescription)
            
        }
        
    }
    
    static func fetchAllUsers() async throws -> [User]{
        guard let uid = Auth.auth().currentUser?.uid else {return []}
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self) })
        return users.filter({$0.id != uid})
    }
    
    func reset(){
        self.currentUser = nil
    }
}
