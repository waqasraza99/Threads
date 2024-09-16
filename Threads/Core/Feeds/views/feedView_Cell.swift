//
//  feedView_Cell.swift
//  Threads
//
//  Created by Waqas Raza on 02/01/2024.
//

import SwiftUI

struct feedView_Cell: View {
    var body: some View {
        VStack{
            HStack(alignment:.top,spacing: 12){
                Image("img")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2){
                    
                    HStack {
                        Text("waqas raza")
                            .font(.title2)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        })
                    }
                    
                    Text("imperiior is the strength")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        
                    HStack(spacing:16){
                        
                        Button(action: {
                            
                        }, label: {
                           Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                           Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                           Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                           Image(systemName: "paperplane")
                        })
                        
                    }.padding()
                        .foregroundColor(.black)
                    
                }
            }
            Divider()
        }.padding()
    }
}

#Preview {
    feedView_Cell()
}
