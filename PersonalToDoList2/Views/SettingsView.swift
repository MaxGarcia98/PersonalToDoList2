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
                                .foregroundStyle(Color.primary)
                                .fontWeight(.bold)
                        })
                    }
                }
                .sheet(isPresented: $settingsSheet) {
                    NavigationStack {
                        List {
                            Section {
                                HStack {
                                    NavigationLink(destination: AccountSettingsView()) {
                                        Image(systemName: "person.circle")
                                        Text("Account")
                                    }
                                    
                                }
                                
                                HStack {
                                    NavigationLink(destination: GeneralSettingsView()) {
                                        Image(systemName: "gearshape")
                                        Text("General")
                                    }
                                }
                            }
                            
                            Section {
                                HStack {
                                    NavigationLink(destination: ThemeSettingsView()) {
                                        Image(systemName: "paintpalette")
                                        Text("Theme")
                                    }
                                }
                                HStack {
                                    NavigationLink(destination: AppIconSettingsView()) {
                                        Image(systemName: "switch.programmable.square.fill")
                                        Text("App Icon")
                                    }
                                }
                                HStack {
                                    NavigationLink(destination: NavigationMenuSettingsView()) {
                                        Image(systemName: "list.bullet")
                                        Text("Navigation Menu")
                                    }
                                }
                                HStack {
                                    NavigationLink(destination: QuickAddSettingsView()) {
                                        Image(systemName: "doc.fill.badge.plus")
                                        Text("Quick Add")
                                    }
                                }
                            } header: {
                                Text("Personalization")
                            }
                            
                            Section {
                                Text("Productivity")
                                Text("Notifications")
                            } header: {
                                Text("Personalization")
                            }
                            
                            Section {
                                Text("Siri")
                            }
                            
                            Section {
                                Text("Help & Feedback")
                                Text("About")
                                Text("What's New")
                                Text("Sync")
                            }
                            
                        }
                        .navigationTitle("Settings")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            Button("Done") {
                                settingsSheet = false
                            }
                        }
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
