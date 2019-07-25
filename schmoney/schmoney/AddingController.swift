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
