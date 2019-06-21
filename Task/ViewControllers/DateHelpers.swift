//
//  DateHelpers.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
    
}
