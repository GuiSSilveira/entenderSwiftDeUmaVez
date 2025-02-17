//
//  AppDelegate.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 31/01/25.
//

import SwiftUI

@main
struct ToDoApp: App {
    @StateObject private var coordinator = ToDoCoordinator()

    var body: some Scene {
        WindowGroup {
            // Passa o coordenador para a ToDoListView
            ToDoListView(coordinator: coordinator) // Agora a ToDoListView usa o coordenador
        }
    }
}

