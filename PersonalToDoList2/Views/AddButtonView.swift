//
//  AddButtonView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct AddButtonView: View {
    
    @State var showAddSheet = false
    @State var buttonAnimation = false
    let buttonPressed = UIImpactFeedbackGenerator(style: .heavy)
    
    init() {
        buttonPressed.prepare()
    }
    
    var body: some View {
        Button(action: {
            showAddSheet.toggle()
            buttonPressed.impactOccurred()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 65)
                .foregroundStyle(Color.primary)
                .fontWeight(.bold)
                .opacity(0.75)
                
    })
        .padding()
        .sheet(isPresented: $showAddSheet, content: {
            AddItemViewButton()
                .presentationDetents([.medium])
        })
    }
}





struct AddItemViewButton: View {
    
    @State var datePicked: Date = .now
    @State var addLikeToDoText: String = ""
    @State var descriptionText: String = ""
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        
        VStack(spacing: -10) {
                TextField("What would you like to add?", text: $addLikeToDoText)
                .font(.title2)
                .fontWeight(.semibold)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            keyboardFocused = true
                        }
                    }
                    .padding(8)
    
            TextField("Description", text: $descriptionText)
                .font(.headline)
                .fontWeight(.medium)
                .padding(8)
            
            HStack {
                Button(action: {
                  
                }, label: {
                    Image(systemName: "calendar")
                    Text("No date")
                        
                })
                .foregroundStyle(Color(.systemGray2))
                .frame(height:20)
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray2), lineWidth: 0.5)
                )
                
                Menu {
                    
                    Section {
                        Button("None") {}
                    }
                    Button("Low") {}
                    Button("Medium") {}
                    Button("High") {}
                } label: {
                     Label("Priority", systemImage: "flag")
                }
                .foregroundStyle(Color(.systemGray2))
                .frame(height:20)
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray2), lineWidth: 0.5)
                )
                
                Menu {
                    Button("High") {}
                } label: {
                    Label("Reminder", systemImage: "alarm")
                }
                .foregroundStyle(Color(.systemGray2))
                .frame(height:20)
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray2), lineWidth: 0.5)
                )
                
                Menu {
                    Section {
                        Button("Edit Task Actions") {}
                    }
                    
                    Button("Label") {}
                    Button("Location") {}
                    
                } label: {
                    Label("", systemImage: "ellipsis")
                }
                .foregroundStyle(Color(.systemGray2))
                .frame(height:20)
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray2), lineWidth: 0.5)
                )
                
                Spacer()
            }
            .padding(8)
//            HStack {
//                Menu("Priority") {
//                    Button("button", action: choosePriority)
//                }
//                .font(.subheadline)
//                .foregroundStyle(Color(.systemGray2))
//                Spacer()
//            }
//            .padding(8)
            
            Divider()
                .background(Color(.systemGray2))
                .padding(8)
            Spacer()
            
        }
        
        
            .ignoresSafeArea(.keyboard)
        
        
        
        
        
        
        
        
        
//        HStack {
//            Image(systemName: "calendar")
//            Image(systemName: "flag.fill")
//            Image(systemName: "tag.fill")
//            Spacer()
//            Image(systemName: "paperplane.fill")
//        }
//        .padding()
//        .foregroundStyle(Color(.systemGray2))
    }
    
    func choosePriority() {}
}


#Preview {
    AddButtonView()
}
