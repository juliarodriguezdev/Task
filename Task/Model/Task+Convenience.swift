//
//  Task+Convenience.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult
    
    convenience init(name: String, notes: String? = nil, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
    }
    
}
