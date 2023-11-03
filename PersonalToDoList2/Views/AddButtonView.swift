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
            AddItemViewButtonMenu()
                .presentationDetents([.medium])
        })
       
    }
}





struct AddItemViewButtonMenu: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
//    @State private var item = ItemModel()
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var datePicked: Date = .now
    @State var addLikeToDoText: String = ""
    @State var descriptionText: String = ""
    @FocusState private var keyboardFocused: Bool
    let priority = ["None", "Low", "Medium", "High"]
    @State private var showCalendarView = false
    
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
//                // CALENDER button //
                
                Button(action: {
                    showCalendarView.toggle()
                }, label: {
                    Image(systemName: "calendar")
                })
                .sheet(isPresented: $showCalendarView, content: {
                    CalendarView()
//                        .presentationDetents([.medium])
                })
                .modifier(MenuButtonStyle())
                
                
                
                    
                // Menu section for the PRIORITY button //
                Menu {
                    Section {
                        Button("None") {}
                    }
                    Button("Low") {}
                    Button("Medium") {}
                    Button("High") {
                        
                    }
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
                
                
                // Add item button
                Button(action: {
                    saveToDo()
                    dismiss()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                })
            }
            .padding(8)
            
            Spacer()
                .frame(height: 20)
    
            Divider()
                .background(Color(.systemGray2))
            
            Spacer()
        }
    }
    
    func saveToDo() {
        listViewModel.addItem(title: addLikeToDoText, description: descriptionText)
        
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
        .modelContainer(for: ItemModel.self)
}
