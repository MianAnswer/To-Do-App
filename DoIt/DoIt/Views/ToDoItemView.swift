//
//  ToDoItemView.swift
//  DoIt
//
//  Created by Mian Answer on 12/3/23.
//

import SwiftUI

struct ToDoItemView: View {
    @ObservedObject private var viewModel: ViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.toDoItem.task)
                .font(.title2)
            Text(viewModel.toDoItem.dueDate.formatted(date: .numeric, time: .shortened))
                .font(.title3)
            Text(viewModel.toDoItem.overdue.description)
        }
    }
    
    init(toDoItem: ToDoItem) {
        self.viewModel = ViewModel(toDoItem: toDoItem)
    }
}

#Preview {
    ToDoItemView(toDoItem: ToDoItem.examples[0])
}
