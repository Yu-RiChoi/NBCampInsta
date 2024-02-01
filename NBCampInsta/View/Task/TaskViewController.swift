//
//  CoreDataViewController.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/31/24.
//

import UIKit
import CoreData

class TaskViewController: UIViewController  {
    
    let taskCollectionView = TaskCollectionView()
    
    var todos: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(taskCollectionView)
    }
    
    private func setAutoLayout() {
        
        taskCollectionView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(view).inset(10)
        }
    }
}
