//
//  ViewController.swift
//  HomeWork2
//
//  Created by Nikita Neluybin on 18.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var startButton: UIButton!
    
    let flashOff: CGFloat = 0.3
    let flashOn: CGFloat = 1
    enum CurrentLight {
    case red, yellow, green
    }
    var currentLight = CurrentLight.red

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.alpha = flashOff
        yellowView.alpha = flashOff
        greenView.alpha = flashOff
    }
    
    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = redView.layer.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.layer.frame.height / 2
        greenView.layer.cornerRadius = greenView.layer.frame.height / 2
        startButton.layer.cornerRadius = 15
    }
    @IBAction func startButtonPressed() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            redView.alpha = flashOn
            yellowView.alpha = flashOff
            greenView.alpha = flashOff
            currentLight = .yellow
        case .yellow:
            redView.alpha = flashOff
            yellowView.alpha = flashOn
            greenView.alpha = flashOff
            currentLight = .green
        case .green:
            redView.alpha = flashOff
            yellowView.alpha = flashOff
            greenView.alpha = flashOn
            currentLight = .red
        }
    }
}

