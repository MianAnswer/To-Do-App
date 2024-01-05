//
//  ToDoItem.swift
//  DoIt
//
//  Created by Mian Answer on 12/3/23.
//

import Foundation

struct ToDoItem: Identifiable {
    let id: UUID = UUID()
    let createdAt: Date = Date.now
    
    var task: String
    var updatedAt: Date = Date.now
    var dueDate: Date
    var completed: Bool = false
    var repeated: Bool = false
    var endRepeatDate: Date? = nil
    
    var overdue: Bool {
        switch dueDate.compare(Date.now) {
        case .orderedAscending:
            true
        case .orderedSame:
            false
        case .orderedDescending:
            false
        }
    }
    
    static let examples = [
        ToDoItem(task: "Clean Kitchen", dueDate: Date.distantFuture),
        ToDoItem(task: "Clean Car", dueDate: Date.now),
        ToDoItem(task: "Clean Sofa", dueDate: Date.init(timeIntervalSinceNow: TimeInterval(60))),
        ToDoItem(task: "Clean Living Room", dueDate: Date.distantPast),
        ToDoItem(task: "Clean Bedroom", dueDate: Date.distantFuture),
        ToDoItem(task: "Clean Bathroom", dueDate: Date.distantPast),
        ToDoItem(task: "Clean Everything", dueDate: Date.distantFuture)
    ]
}
