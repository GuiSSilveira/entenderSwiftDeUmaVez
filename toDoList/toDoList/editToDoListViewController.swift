//
//  editToDoListViewController.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import SwiftUI

class editToDoListViewController: UIViewController {
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editar", for: .normal)
        return button
    }()
    
    private lazy var textEditedToDo: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    // MARK: - ViewModel
    
    private var viewModel: ToDoListViewModel?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
//        setupConstraints()
    }
    
    private func setupViews() {
        containerView.addSubview(backButton)
        containerView.addSubview(editButton)
        containerView.addSubview(textEditedToDo)
        view.addSubview(containerView)
    }
    
    
//    private func setupConstraint() {
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: view.topAnchor),
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            backButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 16),
//            backButton.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            backButton.widthAnchor.constraint(equalToConstant: 44),
//            backButton.heightAnchor.constraint(equalToConstant: 44)
//        ])
//        
//        editButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            editButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 16),
//            editButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
//            editButton.widthAnchor.constraint(equalToConstant: 44),
//            editButton.heightAnchor.constraint(equalToConstant: 44)
//        ])
//        
//        textEditedToDo.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textEditedToDo.topAnchor.
//        ])
//        
//        
        
    }
}
