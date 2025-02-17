import SwiftUI

// Modelo de tarefa
struct TaskModel: Identifiable, Hashable {
    let id = UUID()
    var text: String
    var isCompleted: Bool
    
    static func ==(lhs: TaskModel, rhs: TaskModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class ToDoListViewModel: ObservableObject {
    @Published var tasks: [TaskModel]
    var coordinator: ToDoCoordinator

    init(coordinator: ToDoCoordinator) {
        self.coordinator = coordinator
        self.tasks = [TaskModel(text: "Nova Tarefa", isCompleted: false)]
    }

    // Função chamada ao clicar na tarefa
    func taskTapped(task: TaskModel) {
        coordinator.showEditTaskView(task: task)
    }

    // Função para adicionar nova tarefa
    func addTask() {
        tasks.append(TaskModel(text: "Nova Tarefa", isCompleted: false))
    }

    // Função para alternar entre concluído/não concluído
    func toggleTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    // Função para atualizar o texto da tarefa
    func updateTaskText(taskId: UUID, newText: String) {
        if let index = tasks.firstIndex(where: { $0.id == taskId }) {
            tasks[index].text = newText
        }
    }
}
