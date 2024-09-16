//
//  EditProfileView.swift
//  Threads
//
//  Created by Waqas Raza on 05/01/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var bioRTF = ""
    @State private var linkRTF = ""
    @State private var isOnProfile = false
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("waqas raza")
                        
                        Text("many to thing")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        if let image = viewModel.profileImg {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                        } else {
                            Image("img")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Bio")
                    
                    TextField("Enter your bio ", text: $bioRTF)
                        .font(.footnote)
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Link")
                    
                    TextField("Add link...", text: $linkRTF)
                        .font(.footnote)
                }
                .padding(.horizontal)
                
                Divider()
                
                Toggle("Private Profile", isOn: $isOnProfile)
                    .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // Action for Done button
                    }
                    .fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
