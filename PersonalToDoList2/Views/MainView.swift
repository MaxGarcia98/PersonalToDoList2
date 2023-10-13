//
//  ContentView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct MainView: View {
    
    @State var settingsToggle: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
            NoItemsView()
            SettingsView()
            }
            .navigationTitle(Text("My day"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "square")
                    })
                }
            }
            .sheet(isPresented: $settingsToggle) {
                NavigationStack {
                    Text("Settings")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
