//
//  WelcomeMenuView.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/16/23.
//

import SwiftUI

struct WelcomeMenuView: View {
    var body: some View {
        
        List {
            Section {
                Text("Hello")
            } header: {
                Text("Getting Started")
            }
            Section {
               Text("text")
            } header: {
                 Text("Key Features")
            }
            Section {
                Text("fd")
            } header: {
                 Text("Explore more")
            }
        }
    }
}


#Preview {
    NavigationStack {
        WelcomeMenuView()
    }
}
