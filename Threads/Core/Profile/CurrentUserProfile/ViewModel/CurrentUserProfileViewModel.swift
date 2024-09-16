//
//  profileViewModel.swift
//  Threads
//
//  Created by Waqas Raza on 07/01/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject{
    @Published var  currentUser : User?
    @Published var selectedItem: PhotosPickerItem?{
        didSet {Task {await loadImage()}}
    }
    @Published var profileImg: Image?
    private var cancelables =  Set<AnyCancellable>()
    
    init(){
        
      setUpSubscribers()
        
    }
    
    private func setUpSubscribers(){
        userService.shared.$currentUser.sink{ [weak self ] user in
            self?.currentUser = user
        }.store(in: &cancelables)
    }
    
    func loadImage() async{
        guard let item = selectedItem else{return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiimage = UIImage(data: data) else {return}
        self.profileImg = Image(uiImage: uiimage)
    }
}
