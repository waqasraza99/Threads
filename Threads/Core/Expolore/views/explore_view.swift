//
//  explore_view.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct explore_view: View {
    
    @State private var searchTF = ""
    
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(spacing:16){
                    ForEach(viewModel.Users){users in
                        
                        NavigationLink(value: users) {
                            exploreViewCell(user: users)
                        }
                        
                       
                    }
                }
                Divider()
            }.navigationDestination(for: User.self, destination: {
                user in
                profile_view(user: user)
            })
            .searchable(text: $searchTF, prompt: "Search")
            .navigationTitle("Search")
        }
    }
}

#Preview {
    NavigationStack{
        explore_view()
    }
   
}
