//
//  TaskController.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // Singleton, sharedInstance
    static let sharedInstance = TaskController()
    
    var tasks: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
    }
    var mockTasks: [Task] = []
    
    // CRUD Functions
    
    //Create
    func add(taskWithName name: String, notes: String?, due: Date?){
      
    }
    
    // Update
    func update(task: Task, name: String, notes: String?, due: Date?){
        Task(name: name, notes: notes, due: due)
        
    }
    
    // Delete
    func remove(task: Task){
        
    }
    
    // Save
    func saveToPersistentStore() {
        
        // fetch
    }
    
    func toggleIsCompleteFor(task: Task) {
       task.isComplete = !task.isComplete
        }
    
    }

