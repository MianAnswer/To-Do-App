//
//  ContentView-ViewModel.swift
//  DoIt
//
//  Created by Mian Answer on 12/3/23.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var toDoItems: [ToDoItem]

        init(toDoItems: [ToDoItem]) {
            self.toDoItems = toDoItems
        }
        
        func addToDoItem(_ toDoItem: ToDoItem) {
            toDoItems.append(toDoItem)
        }
        
        func removeToDoItem(_ toDoItem: ToDoItem) {
            if let index = toDoItems.firstIndex(where: { $0.id == toDoItem.id }) {
                toDoItems.remove(at: index)
            }
        }
        
        func saveToDoItem(_ toDoItem: ToDoItem) {
            if let index = toDoItems.firstIndex(where: { $0.id == toDoItem.id }) {
                toDoItems[index] = toDoItem
            }
        }
    }
}
