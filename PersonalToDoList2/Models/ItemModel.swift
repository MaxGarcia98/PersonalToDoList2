import Foundation
import SwiftData

@Model
class ItemModel: Identifiable, ObservableObject {
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
         date: Date,
         priority: String) {
        self.id = id
        self.title = title
        self.tododescription = description
        self.isCompleted = isCompleted
        self.date = date
        self.priority = priority
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, description: tododescription, isCompleted: !isCompleted, date: date, priority: priority)
    }
}
//
//class DateManager: ObservableObject {
//    @Published var dateChosen = Date()
//}
