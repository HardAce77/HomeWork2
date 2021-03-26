//
//  ViewController.swift
//  HomeWork2
//
//  Created by Nikita Neluybin on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
        
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        mainView.layer.cornerRadius = 20
        
        setupColor(for: mainView)
        setupValues(for: redLabel, greenLabel, blueLabel)
    }
    
    //MARK: - IB Actions
    @IBAction func rgbSliderValueChange(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redLabel.text = convertValueToString(from: sender)
        case 1:
            greenLabel.text = convertValueToString(from: sender)
        default:
            blueLabel.text = convertValueToString(from: sender)
        }
        
        setupColor(for: mainView)
    }
    
    // MARK: - Private Methods
    private func setupValues(for labels: UILabel...) {
        labels.forEach { (label) in
            switch label.tag {
            case 0:
                label.text = convertValueToString(from: redSlider)
            case 1:
                label.text = convertValueToString(from: greenSlider)
            default:
                label.text = convertValueToString(from: blueSlider)
            }
        }
    }
    
    private func convertValueToString(from slider: UISlider) -> String {
        String(format: "%.2f",slider.value)
    }
    
    private func setupColor(for view: UIView) {
        view.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                       green: CGFloat(greenSlider.value),
                                       blue: CGFloat(blueSlider.value),
                                       alpha: 1)
    }

}

