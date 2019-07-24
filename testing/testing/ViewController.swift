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
        let topColor = UIColor(red: 146/255, green: 254/255, blue: 157/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 201/255, blue: 255/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 0.6]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
        // Do any additional setup after loading the view, typically from a nib.
    }


