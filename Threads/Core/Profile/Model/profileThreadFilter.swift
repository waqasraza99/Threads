//
//  profileThreadFilter.swift
//  Threads
//
//  Created by Waqas Raza on 02/01/2024.
//

import Foundation

enum profileThreadsFilter: Int, CaseIterable , Identifiable{
    
    case threads
    case replies
//    case likes
    
    var title: String{
        switch self {
        case.threads : return "Threads"
        case.replies : return "Replies"
//        case.likes : return "Likes"
        }
    }
    var id: Int {return self.rawValue}
}
