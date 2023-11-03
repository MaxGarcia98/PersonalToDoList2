//
//  ToDoListItemViewModel.swift
//  PersonalToDoList2
//
//  Created by Maximino Garcia II on 11/2/23.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "First Title", description: "hi", isCompleted: true, priority: "High"),
            ItemModel(title: "Second", description: "hi", isCompleted: false, priority: "High"),
            ItemModel(title: "Second", description: "hi", isCompleted: false, priority: "High"),
            ItemModel(title: "Second", description: "hi", isCompleted: true, priority: "High"),
            ItemModel(title: "Second", description: "hi", isCompleted: false, priority: "!!!")
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, description: String) {
        let newItem = ItemModel(title: title, description: description, isCompleted: false, priority: "High")
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
}
