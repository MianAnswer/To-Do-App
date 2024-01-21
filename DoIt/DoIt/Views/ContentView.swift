//
//  ContentView.swift
//  DoIt
//
//  Created by Mian Answer on 12/2/23.
//

import SwiftUI

private enum Filter {
    case none, today, week, month, overdue
}

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(toDoItems: ToDoItem.examples)

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    listFactory(filter: .none)
                } label: {
                    Text("All Tasks")
                }
                NavigationLink {
                    listFactory(filter: .today)
                } label: {
                    Text("Today's Tasks")
                }
                NavigationLink {
                    listFactory(filter: .week)
                } label: {
                    Text("Week's's Tasks")
                }
                NavigationLink {
                    listFactory(filter: .month)
                } label: {
                    Text("Month's Tasks")
                }
                NavigationLink {
                    listFactory(filter: .overdue)
                } label: {
                    Text("Overdue Tasks")
                }
            }
        }
    }
    
    private func listFactory(filter: Filter) -> ToDoListView {
        let title: String
        let items: [ToDoItem]
        
        switch filter {
        case .none:
            title = "All Tasks"
            items = viewModel.toDoItems
        case .today:
            title = "Today's Tasks"
            items = viewModel.toDoItems.filter({ item in
                Calendar.current.isDateInToday(item.dueDate)
            })
        case .week:
            title = "Week's Tasks"
            items = viewModel.toDoItems.filter({ item in
                Calendar.current.isDate(item.dueDate, equalTo: Date.now, toGranularity: .weekOfYear)
            })
        case .month:
            title = "Month's Tasks"
            items = viewModel.toDoItems.filter({ item in
                Calendar.current.isDate(item.dueDate, equalTo: Date.now, toGranularity: .month)
            })
        case .overdue:
            title = "Overdue Tasks"
            items = viewModel.toDoItems.filter({ item in
                item.overdue
            })
        }
        
        return ToDoListView(
            title: title,
            toDoItems: items,
            removeToDoItem: { viewModel.removeToDoItem($0) },
            addToDoItem: { viewModel.addToDoItem($0) },
            saveToDoItem: { viewModel.saveToDoItem($0) }
        )
    }
}

#Preview {
    ContentView()
}
