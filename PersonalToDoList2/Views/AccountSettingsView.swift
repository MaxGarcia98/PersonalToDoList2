//
//  Account.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        List {
            Section {
                Text("Maximino Garcia II")
            } header: {
                Text("Full Name")
            }
            
            Section {
                Text("maxgarcia23423@gmail.com")
            } header: {
                Text("Email")
            }
            
            Section {
                Text("Add Password")
            } header: {
                Text("Password")
            }
            
            Section {
                Text("Require 2FA")
            } header: {
                Text("two factor authentication")
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccountSettingsView()
            .navigationTitle("Todolist")
            .navigationBarTitleDisplayMode(.inline)
    }
}
