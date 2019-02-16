//
//  ViewController.swift
//  newTodoProject
//
//  Created by Bibek Shrestha on 2/15/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBAction func hamburgurMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "TaskComplete") as! TaskComTableViewController
        VC.markedCompletedTextList = completedArray
        self.navigationController?.pushViewController(VC, animated: true)

    }
    
    var newTodoList: String = ""
    var todoListArray: [String] = []
    
    var newCompletedList: String = ""
    var completedArray: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = todoListArray[indexPath.row]
        return cell
    }
    
    //Complete Function
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "Complete") { (contextualAction, view, boolValue) in
            print("Tap completed button")
            
            self.completedArray.insert(self.todoListArray[indexPath.row], at: 0)
            self.todoListArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(self.todoListArray, forKey: "task")
            
            let VC = self.storyboard!.instantiateViewController(withIdentifier: "TaskComplete") as! TaskComTableViewController
            VC.markedCompletedTextList = self.completedArray
            UserDefaults.standard.set(VC.markedCompletedTextList, forKey: "completed")
            
            self.reloadInputViews()
            
            
            print(self.completedArray)
        }
        contextItem.backgroundColor = .green
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        
        return swipeActions
    }

    //Delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.todoListArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(todoListArray, forKey: "task")
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        //label.text = newTodoList
        print("Going back")
        todoListArray.insert(newTodoList, at: 0)
    
        UserDefaults.standard.set(todoListArray, forKey: "task")
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        todoListArray = UserDefaults.standard.array(forKey: "task") as! [String]
    }


}

