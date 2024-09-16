//
//  splash_View.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct splash_View: View {
    
    @State var ShowProgress = false
    @State var Navigate = false
    
    var body: some View {
        ZStack(alignment:.center){
            
            VStack{
                
                Image("threads_app_icon")
                    .aspectRatio(contentMode: .fit)
                
                if ShowProgress{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(2.3)
                        .padding(.bottom)
                }
            }
          
            
                
        } .onAppear{
            ShowProgress = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                Navigate = true
                ShowProgress = false
            }
        }.navigationDestination(isPresented: $Navigate) {
            ContentView()
        }
        
    }
}

#Preview {
    splash_View()
}
