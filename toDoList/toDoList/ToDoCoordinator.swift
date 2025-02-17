import SwiftUI

class ToDoCoordinator: ObservableObject {
    @Published var currentView: AnyView
    var viewModel: ToDoListViewModel?

    // Inicialize todas as propriedades no init
    init() {
        // Inicialize a currentView antes de qualquer coisa
        self.currentView = AnyView(EmptyView())  // Inicializa a currentView
        
        // Agora, inicializamos o viewModel
        self.viewModel = ToDoListViewModel(coordinator: self)  // Inicializa o viewModel depois da currentView
        
        // Chama o método para configurar a view inicial
        self.setUpInitialView()
    }

    private func setUpInitialView() {
        // Agora podemos usar self.viewModel, pois já foi inicializado
        self.currentView = AnyView(ToDoListView(coordinator: self))
    }

    func showEditTaskView(task: TaskModel) {
        // Certifique-se de que o viewModel foi inicializado antes de usá-lo
        if let viewModel = self.viewModel {
            self.currentView = AnyView(EditToDoListView(task: task, viewModel: viewModel))
        }
    }
}
