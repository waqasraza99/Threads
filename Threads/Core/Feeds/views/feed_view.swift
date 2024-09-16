//
//  feed_view.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct feed_view: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators:false) {
                LazyVStack(){
                    ForEach(0...10, id: \.self) {
                        thread in
                        feedView_Cell()
                    }
                    
                }
                
            }.refreshable {
                
            }.navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
            
        }.toolbar{
            ToolbarItem(placement:.navigationBarTrailing){
                Button(action: {
                    
                }, label: {
                   Image(systemName: "arrow.counterclockwise")
                })
            }
        }.foregroundColor(.black)
    }
}

#Preview {
    NavigationStack{
        feed_view()
    }
    
}
