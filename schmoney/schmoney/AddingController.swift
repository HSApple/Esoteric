//
//  AddingController.swift
//  schmoney
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class AddingController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var task: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        performSegue(withIdentifier: "seeBalance", sender: Any?.self)
    }
    
    @IBAction func plus(_ sender: Any) {
        let itemObject = UserDefaults.standard.object(forKey: "list")
        
        var list: [String]
        
        if let tempTask = itemObject as? [String] {
            list = tempTask
            list.append(task.text!)
            
            print(list)
        } else {
            list = [task.text!]
            
        }
        UserDefaults.standard.set(list, forKey: "list")
        
        task.text = ""
        
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesData[row]
    }
    
    var categoriesData: [String] = [String]()
    
    @IBOutlet weak var categories: UIPickerView!

        // Do any additional setup after loading the view.
        
    var timer = Timer()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        
        self.categories.delegate = self
        self.categories.dataSource = self
        
        categoriesData = ["Food", "School", "Bills", "Transportation", "Clothes", "Entertainment", "Gifts"]
        
        
    }
    
    
        @objc func tick() {
            dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
            
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
