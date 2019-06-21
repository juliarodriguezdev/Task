//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?
    
    @IBOutlet weak var taskNameText: UITextField!
    
    @IBOutlet weak var dueDateText: UITextField!
    
    @IBOutlet weak var notesSectionText: UITextView!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTask()
        dueDateText.inputView = dueDatePicker
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
       updateTask()
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = dueDatePicker.date
        dueDateText.text = dueDatePicker.date.stringValue()
    }
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
    }
    
    
    
    func updateTask() {
        
        guard let name = taskNameText.text else { return }
        guard let dueDate = dueDateValue else { return }
        guard let notes = notesSectionText.text else { return }
        guard let task = task else { return }
        
        if task == self.task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: dueDate)
        } else {
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: dueDate)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func updateViews() {
        taskNameText.text = task?.name
        notesSectionText.text = task?.notes
        dueDateText.text = task?.due?.stringValue()
        
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
