//
//  CoreDataViewController.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/31/24.
//

import UIKit
import CoreData

class TaskViewController: UIViewController  {
    
    private let collectionView = {
        var collectionViewFlowLayout = UICollectionViewFlowLayout()
        
        return UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    }()
    
    var dataSource: [NSManagedObject] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    private var todoLabel: UILabel = {
        let label = UILabel()
        label.text = "TODO"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    private var addTodoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        //        button.addTarget(TaskViewController.self, action: #selector(tappedAddTodoButton), for: .touchUpInside)
        
        return button
    }()
    @objc func tappedAddTodoButton() {
        let alert = UIAlertController(title: "할 일 추가", message: "할 일을 입력하세요.", preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "할 일을 입력하세요"
        }
        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            
            guard let title = alert.textFields?.first?.text, !title.isEmpty
            else { return }
            
            CoreDataManager.shared.createtodo(title: title)
            self.dataSource = CoreDataManager.shared.fetchTodo()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    var todos: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = CoreDataManager.shared.fetchTodo()
        
        addTodoButton.addTarget(self, action: #selector(tappedAddTodoButton), for: .touchUpInside)
        
        setUI()
        setAutoLayout()
    }
    
    private func setUI() {
        view.addSubview(todoLabel)
        view.addSubview(addTodoButton)
        view.addSubview(collectionView)
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: TaskCollectionViewCell.identifier)
    }
    
    private func setAutoLayout() {
        
        todoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(2)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        addTodoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(addTodoButton.snp.bottom).offset(20)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension TaskViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.identifier, for: indexPath) as? TaskCollectionViewCell
        else { return UICollectionViewCell() }
        
        if let title = dataSource[indexPath.item].value(forKey: "title") as? String {
            cell.setTitle(title)
        }
        
        if let isCompleted = dataSource[indexPath.item].value(forKey: "isCompleted") as? Bool {
            cell.setSwitch(isCompleted)
        }
        
        if let id = dataSource[indexPath.item].value(forKey: "id") as? UUID {
            cell.setId(id)
        }
        
        cell.delegate = self
        cell.setUI()
        
        return cell
    }
}

extension TaskViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

extension TaskViewController: CoreDataTaskCellDelegate {
    func valueChanged(with id: UUID?, isCompleted: Bool) {
        CoreDataManager.shared.updateTodo(id: id, isCompleted: isCompleted)
        self.dataSource = CoreDataManager.shared.fetchTodo()
    }
}
