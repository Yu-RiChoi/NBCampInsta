//
//  CoreDataManager.swift
//  NBCampInsta
//
//  Created by 최유리 on 2/2/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared: CoreDataManager = .init()
    
    let container = {
        let container = NSPersistentContainer(name: "TaskModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                // 에러 표출
            }
        }
        
        return container
    }()
    
    private init() {}
    
    func fetchTodo() -> [NSManagedObject] {
        let context = container.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "TaskData")
        let result = try? context.fetch(fetchRequest)
        
        return result ?? []
    }
    
    func createtodo(title: String) {
        let context = container.viewContext
        
        let object = NSEntityDescription.insertNewObject(forEntityName: "TaskData", into: context)
        object.setValue(UUID(), forKey: "id")
        object.setValue(title, forKey: "title")
        object.setValue(Date.now, forKey: "createDate")
        object.setValue(false, forKey: "isCompleted")
        
        do {
            try context.save()
        } catch {
            context.rollback()
        }
    }
    
    func updateTodo(id: UUID?, isCompleted: Bool) {
        let context = container.viewContext
        
        let objects = fetchTodo()
        let targetObject = objects.first(where: {
            if let todoId = $0.value(forKey: "id") as? UUID, id == todoId {
                return true
            } else { return false }
        })
        
        targetObject?.setValue(isCompleted, forKey: "isCompleted")
        targetObject?.setValue(Date.now, forKey: "modifyDate")
        
        do {
            try context.save()
        } catch {
            context.rollback()
        }
    }
}
