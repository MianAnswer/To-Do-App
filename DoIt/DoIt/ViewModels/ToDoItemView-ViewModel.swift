//
//  ToDoItemView-ViewModel.swift
//  DoIt
//
//  Created by Mian Answer on 12/3/23.
//

import Foundation

extension ToDoItemView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var toDoItem: ToDoItem
        
        init(toDoItem: ToDoItem) {
            self.toDoItem = toDoItem
        }
        
        func update(dueDate: Date) {
            toDoItem.dueDate = dueDate
            toDoItem.updatedAt = Date.now
        }
        
        func update(task: String) {
            toDoItem.task = task
            toDoItem.updatedAt = Date.now
        }
        
        func completed() {
            toDoItem.completed = true
            toDoItem.updatedAt = Date.now
        }
    }
}
