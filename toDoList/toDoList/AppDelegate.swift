//
//  AppDelegate.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 31/01/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = ToDoListViewModel()
        let rootViewController = ToDoListViewController(viewModel: viewModel)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

