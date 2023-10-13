//
//  AddItemsView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI
import SwiftData

struct AddItemsView: View {
    @State var newToDo: String = ""
//    @Environment(\.dismiss) var dismiss
//    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
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
//        func addNewItems() {
//            Text("Hello")
//        }
    }
}

#Preview {
    NavigationStack {
        AddItemsView()
            .navigationTitle("Todolist")
            .navigationBarTitleDisplayMode(.inline)
    }
//    .environmentObject(ListViewModel())
}
