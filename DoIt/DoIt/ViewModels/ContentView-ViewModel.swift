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
        
        func addToDoItem(toDoItem: ToDoItem) {
            toDoItems.append(toDoItem)
        }
        
        func removeToDoItem(at offsets: IndexSet) -> Void {
            toDoItems.remove(atOffsets: offsets)
        }
    }
}
