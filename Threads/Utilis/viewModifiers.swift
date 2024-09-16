//
//  viewModifiers.swift
//  Threads
//
//  Created by Waqas Raza on 26/12/2023.
//

import SwiftUI

struct ThreadsTextfieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.subheadline)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal,12)
    }
}

struct ThreadsButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 350, height: 45)
            .background(Color.black)  // Use Color.black for background
            .cornerRadius(10)
            .padding(.top,20)

    }
}
