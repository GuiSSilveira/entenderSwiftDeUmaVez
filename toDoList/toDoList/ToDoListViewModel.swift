//
//  ToDoListViewModel.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 04/02/25.
//

import SwiftUI

// Modelo de tarefa
struct TaskModel: Identifiable {
    let id = UUID()
    var text: String
    var isCompleted: Bool
}

class ToDoListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = [
        TaskModel(text: "Nova Tarefa", isCompleted: false)
    ]
    
    // Adicionar nova tarefa
    func addTask() {
        tasks.append(TaskModel(text: "Nova Tarefa", isCompleted: false))
    }
    
    // Alternar entre concluído/não concluído
    func toggleTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
