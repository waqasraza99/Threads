//
//  TabBar_View.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct TabBar_View: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            feed_view()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                    Text("Feeds")
                }.tag(0)
            
            explore_view()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "magnifyingglass.fill" : "magnifyingglass")
                    Text("Search")
                }.tag(1)
            
            
            Text("")
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "plus.fill" : "plus")
                    Text("Post")
                }.tag(2)
                .onTapGesture {
                    print("hh")
                    selectedTab = 2
                    
                }
            
            favourite_view()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                    Text("Search")
                }.tag(3)
            currentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                    Text("Search")
                }.tag(4)
            
        }.tint(.black)
            .sheet(isPresented: .constant(selectedTab == 2), onDismiss: {
                selectedTab = 0
            }, content: {
                add_threads()
            })
    }
}

#Preview {
    
    TabBar_View()
}
