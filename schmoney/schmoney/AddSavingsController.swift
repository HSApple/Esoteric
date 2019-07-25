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
    @IBOutlet weak var startDp: UITextField!
    @IBOutlet weak var endDp: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        performSegue(withIdentifier: "savings", sender: Any?.self)
    }
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        return picker
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    lazy var datePicker2: UIDatePicker = {
        let picker2 = UIDatePicker()
        picker2.datePickerMode = .date
        picker2.addTarget(self, action: #selector(datePicker2Changed(_:)), for: .valueChanged)
        return picker2
    }()
    
    lazy var dateFormatter2: DateFormatter = {
        let formatter2 = DateFormatter()
        formatter2.dateStyle = .medium
        formatter2.timeStyle = .none
        return formatter2
    }()
    
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
        let topColor = UIColor(red: 48/255, green: 210/255, blue: 190/255, alpha: 1)
        let middleColor = UIColor(red: 53/255, green: 132/255, blue: 167/255, alpha: 1)
        let bottomColor = UIColor(red: 71/255, green: 59/255, blue: 123/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, middleColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 0.4, 0.6]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
     
        startDp.inputView = datePicker
        endDp.inputView = datePicker2
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        startDp.text = dateFormatter.string(from: sender.date)
            }
    
    @objc func datePicker2Changed(_ sender: UIDatePicker) {
    endDp.text = dateFormatter.string(from: sender.date)
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

