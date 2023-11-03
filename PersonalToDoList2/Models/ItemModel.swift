import Foundation
import SwiftData

@Model
class ItemModel: Identifiable {
    let id: String
    let title: String
    let tododescription: String
    let isCompleted: Bool
    let date: Date
    let priority: String
    
    init(id: String = UUID().uuidString, 
         title: String,
         description: String,
         isCompleted: Bool,
         date: Date = .now,
         priority: String) {
        self.id = id
        self.title = title
        self.tododescription = description
        self.isCompleted = isCompleted
        self.date = date
        self.priority = priority
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, description: tododescription, isCompleted: !isCompleted, priority: priority)
    }
}

