//
//  TaskViewModel.swift
//  NBCampInsta
//
//  Created by 최유리 on 2/1/24.
//

import UIKit
import CoreData

class TaskViewModel {
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    func saveData() {
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.title = ""
        newTask.createDate = Date()
        newTask.modifyDate = Date()
        newTask.isCompleted = false
    }
    
    func getData() {
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let request = Task.fetchRequest()
        let tasks = try? context.fetch(request)
        
        try? context.save()
    }
}
