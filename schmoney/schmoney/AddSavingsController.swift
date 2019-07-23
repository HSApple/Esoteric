//
//  AddSavingsController.swift
//  schmoney
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class AddSavingsController: UIViewController {

    @IBOutlet weak var newTask: UITextField!
    
    @IBAction func add(_ sender: Any) {
        let itemObject = UserDefaults.standard.object(forKey: "taskList")
        
        var taskList: [String]
        
        if let tempTask = itemObject as? [String] {
            taskList = tempTask
            taskList.append(newTask.text!)
            
            print(taskList)
        } else {
            taskList = [newTask.text!]
            
        }
        UserDefaults.standard.set(taskList, forKey: "taskList")
        
        newTask.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
        
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
