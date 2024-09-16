//
//  exploreViewCell.swift
//  Threads
//
//  Created by Waqas Raza on 02/01/2024.
//

import SwiftUI

struct exploreViewCell: View {
    
    let user: User
    
    var body: some View {
        HStack{
            Image("img")
                .resizable()
                .scaledToFill()
                .frame(width: 50,height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading,spacing: 4){
                
                Text(user.userName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
              
                Text(user.fullName)
                    .font(.footnote)
                
            }.padding()
           
            Spacer()
            
            Text("follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray))
                }
        }.padding(.horizontal)
       Divider()
    }
}
struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        exploreViewCell(user: dev.user)
    }
}
