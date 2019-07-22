//
//  ReminderController.swift
//  schmoney
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ReminderController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 60
            
        default:
            return 0
        }
    }
    
    var hour:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0

        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return pickerView.frame.size.width/3
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch component {
            case 0:
                return "\(row) Hour"
            case 1:
                return "\(row) Minute"
            case 2:
                return "\(row) Second"
            default:
                return ""
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch component {
            case 0:
                hour = row
            case 1:
                minutes = row
            case 2:
                seconds = row
            default:
                break;
            }
        }
    }


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





