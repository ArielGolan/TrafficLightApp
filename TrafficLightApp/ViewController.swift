//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Ariel Golan on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redColorView: UIView!
    @IBOutlet var yellowColorView: UIView!
    @IBOutlet var greenColorView: UIView!
    
    @IBOutlet var startBottun: UIButton!
    
    enum CurrentLightColor {
        case red, yellow, green
    }
    
    var currentLight = CurrentLightColor.red
    let lightIsOn: CGFloat = 1
    let lightIsOff: CGFloat = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorView.alpha = lightIsOff
        yellowColorView.alpha = lightIsOff
        greenColorView.alpha = lightIsOff
        
        startBottun.layer.cornerRadius = 10
        
        redColorView.layer.cornerRadius = redColorView.frame.size.width / 2
        yellowColorView.layer.cornerRadius = yellowColorView.frame.size.width / 2
        greenColorView.layer.cornerRadius = greenColorView.frame.size.width / 2
    }

    @IBAction func startButtonTapped() {
        
        if startBottun.currentTitle == "START" {
            startBottun.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
            
        case .red:
            greenColorView.alpha = lightIsOff
            redColorView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redColorView.alpha = lightIsOff
            yellowColorView.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowColorView.alpha = lightIsOff
            greenColorView.alpha = lightIsOn
            currentLight = .red
        }
    }
    
}

