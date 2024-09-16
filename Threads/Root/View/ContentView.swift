//
//  ContentView.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = contentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                TabBar_View()
            }else{
                login_View()
            }
        }
    }
}

#Preview {
    ContentView()
}
