//
//  GeneralSettingsView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI

struct GeneralSettingsView: View {
    var body: some View {
        List {
            Section {
                Text("Home View")
                Text("Sync Home View")
            } header: {
                Text("Home")
            }
        }
    }
}

#Preview {
    NavigationStack {
        GeneralSettingsView()
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
    }
}
