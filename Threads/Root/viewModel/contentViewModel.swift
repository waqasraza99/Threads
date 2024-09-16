//
//  contentViewModel.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation
import Combine
import Firebase

class contentViewModel: ObservableObject{
    
    @Published var userSession : FirebaseAuth.User?
    
    private var cancelAble = Set<AnyCancellable>()
    
    init(){
        setUpSubscriber()
    }
    
    private func setUpSubscriber(){
        authServices.shared.$userSession.sink{
            [weak self ] userSession in
            self?.userSession = userSession
            print("th",self?.userSession?.uid)
        }.store(in: &cancelAble)
    }
}
