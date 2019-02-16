//
//  SecondViewController.swift
//  newTodoProject
//
//  Created by Bibek Shrestha on 2/15/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var newTodoTextfield: UITextField!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstVC: ViewController = segue.destination as! ViewController
        firstVC.newTodoList = newTodoTextfield.text!
        //print(newTodoTextfield.text)
        //UserDefaults.standard.set(newTodoTextfield.text!, forKey: "task")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
