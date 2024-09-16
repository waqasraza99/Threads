//
//  add_threads.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct add_threads: View {
    
    @State private var threadTF = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack(alignment: .leading){
                    HStack(){
                        Image("img")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        
                        VStack (alignment: .leading , spacing: 4){
                            Text("waqas raza")
                           
                            TextField("Add a thread" ,text: $threadTF , axis: .vertical)
                            
                        }.padding()
                        
                        Spacer()
                        
                        if(!threadTF.isEmpty){
                            Button(action: {
                                threadTF = ""
                            }, label: {
                                Image(systemName: "xmark")
                            })
                            
                        }
                        }
                        
                       
                    Spacer()
                    
                    
                   
                }.padding()
                
            }
            .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(){
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("cancel"){
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Post"){
                            
                        }.opacity(threadTF.isEmpty ?0.5 : 1.0)
                            .disabled(threadTF.isEmpty)
                    
                    }
              
                }.font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    add_threads()
}
