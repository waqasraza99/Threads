//
//  signUp_View.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct signUp_View: View {
    
    @StateObject var viewModel = registrationViewModel()
    
 
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            VStack{
                
                Image("threads_app_icon")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 160)
                   
                
                VStack(alignment:.center,spacing: 16){
                    
                    TextField(
                       "Enter your email",
                       text: $viewModel.emailTF
                    ).autocapitalization(.none)
                    .modifier(ThreadsTextfieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.passTF)
                        .modifier(ThreadsTextfieldModifier())
                          
                    
                    TextField(
                       "Enter your full name",
                       text: $viewModel.fullNameTF
                    )
                    .modifier(ThreadsTextfieldModifier())
                    
                    TextField(
                       "Enter your user name",
                       text: $viewModel.userNameTF
                    )
                    .modifier(ThreadsTextfieldModifier())
                }
                .padding(.vertical)
                .padding(.horizontal)
               
                Button(action: {
                    Task {try await viewModel.createUser()  }
                   
                }, label: {
                    Text("Sign Up")
                        .modifier(ThreadsButtonModifier())

                           

                })
                Spacer()
                
                Divider()
                
                NavigationLink {
                    login_View()
                } label: {
                    
                    Text("Have an account? ")
                    Text("Log In")
                }
                .foregroundColor(.black)
                .font(.footnote)
                

            }.padding(.vertical,16)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    signUp_View()
}
