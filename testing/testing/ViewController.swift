//
//  ViewController.swift
//  testing
//
//  Created by student on 7/24/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
       
    override func viewDidLoad() {
        super.viewDidLoad()
        let topColor = UIColor(red: 48/255, green: 210/255, blue: 190/255, alpha: 1)
        let middleColor = UIColor(red: 53/255, green: 132/255, blue: 167/255, alpha: 1)
        let bottomColor = UIColor(red: 71/255, green: 59/255, blue: 123/255, alpha: 1)
        
        //let middleColor = UIColor(red: 161/255, green: 127/255, blue: 224/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, middleColor.cgColor, bottomColor.cgColor]
        
        //middleColor.cgColor,
        
        let gradientLocations: [Float] = [0.0, 0.4, 0.7]
        
        //0.5,
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
        // Do any additional setup after loading the view, typically from a nib.
    }


