//
//  login_View.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI


struct login_View: View {
    
    @StateObject var viewModel = loginViewModel()
    
    var body: some View {
       
        ZStack{
            VStack{
                
                Spacer()
                
                Image("threads_app_icon")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80,height: 160)
                
                VStack(alignment: .center,spacing: 16){
                    
                    TextField(
                       "Enter your email",
                       text: $viewModel.emailTF
                    )
                    .modifier(ThreadsTextfieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.passTF)
                        .modifier(ThreadsTextfieldModifier())
                }
                .padding(.vertical)
                .padding(.horizontal)
                NavigationLink {
                  
                } label: {
                   Text("Forget Password")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth:.infinity, alignment: .trailing)
                
                }
                
                Button(action: {
                    Task{try await viewModel.login()}
                }, label: {
                    Text("Log in")
                        .modifier(ThreadsButtonModifier())
                           

                })
                Spacer()
                
                Divider()
                
                NavigationLink {
                    
                    signUp_View()
                    
                } label: {
                    Text("Don,t have an account? ")
                    
                    Text("Sign UP")
                }
                .foregroundColor(.black)
                .font(.footnote)
                

            }.padding(.vertical,16)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    login_View()
}
