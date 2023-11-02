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
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: ItemModel.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    
            }
            .modelContainer(for: ItemModel.self)
            .environmentObject(listViewModel)
        }
    }
}
