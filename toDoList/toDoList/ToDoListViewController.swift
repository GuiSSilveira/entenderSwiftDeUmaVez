import UIKit

class ToDoListViewController: UIViewController {
    private let viewModel: ToDoListViewModel
    
    // MARK: - UI Components
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
        label.text = "Task"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var check: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "checkIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Init
    init(viewModel: ToDoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
//        print("viewDidLoad ta carregando caralho")
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup UI
    private func setupViews() {
//        print("vaaaaaaa corinthians")
        view.addSubview(addButton)
        view.addSubview(checkBox)
        view.addSubview(textToDo)
        view.addSubview(check)
    }
    
    private func setupConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        textToDo.translatesAutoresizingMaskIntoConstraints = false
        check.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 44),
            addButton.heightAnchor.constraint(equalToConstant: 44),

            checkBox.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16),
            checkBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            checkBox.widthAnchor.constraint(equalToConstant: 44),
            checkBox.heightAnchor.constraint(equalToConstant: 44),

            textToDo.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8),
            textToDo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            check.centerXAnchor.constraint(equalTo: checkBox.centerXAnchor),
            check.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            check.widthAnchor.constraint(equalToConstant: 22),
            check.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
