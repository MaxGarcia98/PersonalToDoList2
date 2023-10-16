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
        
        VStack(spacing:-20) {
            HStack {
                TextField("What would you like to add?", text: $addLikeToDoText)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            keyboardFocused = true
                        }
                    }
                    .padding(8)
                Image(systemName: "arrow.down.left.and.arrow.up.right")
                    .foregroundStyle(Color(.systemGray2))
                    .padding()
            }
            

            TextField("Description", text: $descriptionText)
                .font(.subheadline)
                .padding(8)
        }
        
        HStack {
            Image(systemName: "calendar")
            Image(systemName: "flag.fill")
            Image(systemName: "tag.fill")
            Spacer()
            Image(systemName: "paperplane.fill")
        }
        .padding()
        .foregroundStyle(Color(.systemGray2))
    }
}


#Preview {
    AddButtonView()
}
