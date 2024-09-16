//
//  PreviewProvider.swift
//  Threads
//
//  Created by Waqas Raza on 09/01/2024.
//

import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id: NSUUID().uuidString, fullName: "waqas raza", email: "waqasraza@gmail.com", userName: "kashi khan")
}
