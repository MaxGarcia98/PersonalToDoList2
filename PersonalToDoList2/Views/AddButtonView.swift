//
//  AddButtonView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI
import SwiftData

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
//    @State var userAddedToDoArray: [String] = []
//    @State var userAddedToDo = ""
    
    var body: some View {
        
        VStack(spacing: -10) {
            TextField("What would you like to add?", text: $addLikeToDoText, axis: .vertical)
                .submitLabel(.done)
                .font(.title2)
                .fontWeight(.semibold)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        keyboardFocused = true
                    }
                    
                }
                .padding(12)
            
            TextField("Description", text: $descriptionText, axis: .vertical)
                .submitLabel(.done)
                .font(.headline)
                .fontWeight(.light)
                .padding(12)
            
            Spacer()
                .frame(height: 40)
            
            HStack {
                // CALENDER button //
                Button(action: {
 
                }, label: {
                    Image(systemName: "calendar")
                    Text("No date")
                    
                })
                .modifier(MenuButtonStyle())
                
                // Menu section for the PRIORITY button //
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
                .modifier(MenuButtonStyle())
                
                // Menu section for the REMINDER button //
                Menu {
                    Button("High") {}
                } label: {
                    Label("Reminder", systemImage: "alarm")
                }
                .modifier(MenuButtonStyle())
                
                // Menu section for the MORE button //
                Menu {
                    Section {
                        Button("Edit Task Actions") {}
                    }
                    
                    Button("Label") {}
                    Button("Location") {}
                    
                } label: {
                    Label("", systemImage: "ellipsis")
                }
                .modifier(MenuButtonStyle())
                
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
            
            Spacer()
                .frame(height: 20)
            
            Divider()
                .background(Color(.systemGray2))
            
            Spacer()
            
//            ForEach(userAddedToDoArray, id: \.self) { item in
//                Text(userAddedToDo)
//            }
        }
        
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
    
    func saveToDo() {
        
    }
}

struct MenuButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color(.systemGray2))
            .frame(height:20)
            .padding(2)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.systemGray2), lineWidth: 0.5)
            )
    }
}

#Preview {
    AddButtonView()
}
