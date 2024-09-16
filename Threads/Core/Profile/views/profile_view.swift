//
//  profile_view.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct profile_view: View {
    
    let user: User
    @State private var selectedFilter: profileThreadsFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(profileThreadsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
   
    var body: some View {
        
            ZStack{
                ScrollView(showsIndicators: false){
                    ZStack {
                        VStack(alignment: .leading, spacing: 4){
                            HStack{
                                Text(user.fullName)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Image("img")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50,height: 50)
                                    .clipShape(Circle())
                                
                                
                            }.padding(.horizontal)
                            
                            Text(user.userName)
                                .font(.footnote)
                                .padding(.leading,20)
                            
                            if let bio = user.bio{
                                Text(bio)
                                    .font(.footnote)
                                    .padding(.leading,20)
                            }
                            
                            Text("initial way to commute abality for custom")
                                .font(.footnote)
                                .padding(.leading,20)
                            
                            Text("4 followers")
                                .font(.footnote)
                                .padding(.leading,20)
                            
                            HStack(spacing:10){
                                
                                NavigationLink(destination: {
                                    // Set the flag to true to present the EditProfileView
                                   EditProfileView()
                                })
                                {
                                    Text("Edit profile")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .frame(width: 160, height: 35)
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color(.systemGray))
                                                
                                        
                                        }
                                }
                                Spacer()
                                     
                                Text("share profile")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .frame(width: 160, height: 35)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(.systemGray))
                                    }
                            
                                        
                            }.padding(.horizontal)
                                
                           
                            
                        }.padding(.vertical)
                    }
                    VStack{
                        Button(action: {
                            
                        }, label: {
                            Text("Follow")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340,height: 40)
                                .background(.black)
                                .cornerRadius(8)
                        })
                        
                        HStack{
                            ForEach(profileThreadsFilter.allCases) {
                                filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if(selectedFilter == filter){
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth , height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    }else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth , height: 1)
                                    }
                                }.onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = filter
                                    }
                                }
                              
                            }
                        }.padding(.vertical,16)
                        LazyVStack{
                            ForEach(0...10 , id: \.self){
                                threads in
                                feedView_Cell()
                            }
                        }
                    }
                }.toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            authServices.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }

                    }
                }
            }
        
    }
}
struct ProfileView_previews: PreviewProvider{
    static var previews: some View{
        profile_view(user: dev.user)
    }
    
}

  
