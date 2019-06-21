//
//  TaskListTableViewController.swift
//  Task
//
//  Created by julia rodriguez on 6/19/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        let task = Task()
        TaskController.sharedInstance.toggleIsCompleteFor(task: task)
        tableView.reloadData()

    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? ButtonTableViewCell else { return UITableViewCell() }

        let task = TaskController.sharedInstance.tasks[indexPath.row]

        //cell.textLabel?.text = task.name
        cell.update(withTask: task)
        cell.delegate = self
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Location of task on Array
            
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
        if segue.identifier == "toTaskDetail" {
        
        guard let index = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? TaskDetailTableViewController else { return }
            let taskToSend = TaskController.sharedInstance.tasks[index.row]
            destinationVC.task = taskToSend
            destinationVC.dueDateValue = taskToSend.due
    }
}

}
