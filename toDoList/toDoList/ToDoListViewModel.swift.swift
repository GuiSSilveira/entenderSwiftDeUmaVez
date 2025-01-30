//
//  ToDoListViewModel.swift.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

class ToDoListViewModel {
    var toDoItems: [String] = []

    func addItem(_ item: String) {
        toDoItems.append(item)
    }

    func getItems() -> [String] {
        return toDoItems
    }
}
