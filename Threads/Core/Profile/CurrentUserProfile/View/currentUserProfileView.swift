//
//  currentUserProfileView.swift
//  Threads
//
//  Created by Waqas Raza on 09/01/2024.
//

import SwiftUI

struct currentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    @State private var selectedFilter: profileThreadsFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(profileThreadsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    @State var showeditprofile = false
    var body: some View {
        NavigationStack {
            ZStack{
                ScrollView(showsIndicators: false){
                    ZStack {
                        VStack(alignment: .leading, spacing: 4){
                            HStack{
                                Text(currentUser?.fullName ?? "")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Image("img")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50,height: 50)
                                    .clipShape(Circle())
                                
                                
                            }.padding(.horizontal)
                            
                            Text(currentUser?.userName ?? "")
                                .font(.footnote)
                                .padding(.leading,20)
                            
                            if let bio = currentUser?.bio{
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
                                
                                Button(action: {
                                    showeditprofile.toggle()
                                }) {
                                    Text("Edit Profile")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .frame(width: 160, height: 35)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(.systemGray), lineWidth: 1) // Specify the stroke width
                                        )
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
                }.sheet(isPresented: $showeditprofile, content: {
                    EditProfileView()
                        .environmentObject(viewModel)
                })
                .toolbar{
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
}

#Preview {
    currentUserProfileView()
}
