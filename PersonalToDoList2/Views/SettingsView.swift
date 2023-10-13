//
//  SettingsView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct SettingsView: View {
    @State var settingsSheet = false
    var body: some View {
        NavigationStack {
            Text("")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            settingsSheet = true
                        }, label: {
                            Image(systemName: "gearshape")
                        })
                    }
                }
                .sheet(isPresented: $settingsSheet) {
                    NavigationStack {
                        List {
                            Section {
                                HStack {
                                    Image(systemName: "person.circle")
                                    Text("Account")
                                }
                                
                                HStack {
                                    Image(systemName: "gearshape")
                                    Text("General")
                                }
                            }
                            
                            Section {
                                Text("hello")
                            } header: {
                                Text("Personalization")
                            }
                        }
                            .toolbar {
                                Button("Save") {
                                    settingsSheet = false
                                }
                            }
                            .navigationTitle("Settings")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .navigationTitle("Todolist")
            .navigationBarTitleDisplayMode(.inline)
    }
}
