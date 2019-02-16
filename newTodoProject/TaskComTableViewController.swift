//
//  TaskComTableViewController.swift
//  newTodoProject
//
//  Created by Bibek Shrestha on 2/15/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class TaskComTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  //  var markedCompletedText = ""
    var markedCompletedTextList: [String] = []

     @IBOutlet weak var completeTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return markedCompletedTextList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = completeTableView.dequeueReusableCell(withIdentifier: "completeCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = markedCompletedTextList[indexPath.row]
//        UserDefaults.standard.set(markedCompletedTextList, forKey: "completed")
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.completeTableView.reloadData()
        markedCompletedTextList = UserDefaults.standard.array(forKey: "completed") as! [String]
        self.completeTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
