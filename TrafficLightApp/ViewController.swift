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
    
    
   private var currentLight = CurrentLightColor.red
   private let lightIsOn: CGFloat = 1
   private let lightIsOff: CGFloat = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorView.alpha = lightIsOff
        yellowColorView.alpha = lightIsOff
        greenColorView.alpha = lightIsOff
        
        startBottun.layer.cornerRadius = 10
        
    }

    override func viewWillLayoutSubviews() {
        redColorView.layer.cornerRadius = redColorView.frame.width / 2
        yellowColorView.layer.cornerRadius = redColorView.frame.width / 2
        greenColorView.layer.cornerRadius = redColorView.frame.width / 2
        
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
// MARK: - CurrentLight
extension ViewController {
    private enum CurrentLightColor {
        case red, yellow, green
    }
}
