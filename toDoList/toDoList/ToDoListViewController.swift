//
//  ToDoListViewController.swift
//  toDoList
//
//  Created by Guilherme Silveira de Souza on 29/01/25.
//

import UIKit

class ToDoListViewController: UIViewController {
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        return button
    }()
    
    private lazy var checkBox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkBoxIcon"), for: .normal)
        return button
    }()
    
    private lazy var textToDo: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var check: UIImage = {
        let image = UIImage(named: "checkBoxIcon")!
        return image
    }()
    
    // MARK: - ViewModel
    private var viewModel: ToDoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        containerView.addSubview(addButton)
        containerView.addSubview(checkBox)
        containerView.addSubview(textToDo)
        view.addSubview(containerView)
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 44),
            addButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            checkBox.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
            checkBox.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        textToDo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textToDo.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            textToDo.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8),
            textToDo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
}
