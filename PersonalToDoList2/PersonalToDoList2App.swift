//
//  PersonalToDoList2App.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 10/13/23.
//

import SwiftUI
import SwiftData

@main
struct PersonalToDoList2App: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    .modelContainer(for: toDoItem.self)
            }
        }
    }
}
