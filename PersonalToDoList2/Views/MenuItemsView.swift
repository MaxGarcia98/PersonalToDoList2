//
//  MenuItemsView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct MenuItemsView: View {
    
    @State private var menuOpened = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                VStack {
                    Text("Content View")
                }
                
                GeometryReader { _ in
                    VStack {
                        SideMenuView()
                            .offset(x: menuOpened ? 0 : UIScreen.main.bounds.width)
//                            .animation(.easeInOut, value: menuOpened)
                    }
                }
                .background(Color.black.opacity(menuOpened ? 0.5 : 0))
                
            }
            .navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        self.menuOpened.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color(.secondaryLabel))
                            .fontWeight(.bold)
                    })
                }
            }
            
            
        }
    }
}

#Preview {
    MenuItemsView()
}