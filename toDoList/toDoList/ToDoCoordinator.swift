import SwiftUI

class ToDoCoordinator: ObservableObject {
    @Published var currentView: AnyView
    
    init() {
        self.currentView = AnyView(EmptyView())
        self.setUpInitialView()
    }
    
    private func setUpInitialView() {
        self.currentView = AnyView(ToDoListView(coordinator: self))
    }

    func showEditTaskView(task: TaskModel) {
        print("Navegando para EditToDoListView com a tarefa: \(task.text)")
        self.currentView = AnyView(EditToDoListView(task: task)) // Passando a tarefa diretamente
    }
}
