//
//  userModel.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation

struct User: Identifiable , Codable , Hashable{
    
    let id: String
    let fullName: String
    let email: String
//    let password: String?
    let userName: String
    var profileImg: String?
    var bio: String?
    
}
