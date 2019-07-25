//
//  MainController.swift
//  schmoney
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    //@IBOutlet weak var timeLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    var list: [String] = []
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        
        
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
    override func viewDidAppear(_ animated: Bool) {
        let itemObject = UserDefaults.standard.object(forKey: "list")
        
        if let tempTask = itemObject as?
            [String] {
            list = tempTask
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(list, forKey: "list")
        }
    }
    
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
}
    
        
    }
    
    

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


