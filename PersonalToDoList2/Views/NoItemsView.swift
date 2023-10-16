//
//  SwiftUIView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var searchedText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                Text("Your list is empty!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                NavigationLink(destination: AddButtonView()) {
                    Text("Add something to your list!")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
    }
}
