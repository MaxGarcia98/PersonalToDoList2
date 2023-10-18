import Foundation
import SwiftData

@Model
final class toDoItem {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    init(title: String = "",
         timestamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
