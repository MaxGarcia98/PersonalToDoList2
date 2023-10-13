//
//  AddItemsView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct AddItemsView: View {
    
    @State var newToDo: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Add new items")
                TextField("Add new todo...", text: $newToDo)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {}, label: {
                    Text("SAVE")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(14)
        }
        
    }
}

#Preview {
    NavigationStack {
        AddItemsView()
            .navigationTitle("Todolist")
            .navigationBarTitleDisplayMode(.inline)
    }
}
