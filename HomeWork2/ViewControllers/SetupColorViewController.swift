//
//  SetupColorViewController.swift
//  HomeWork2
//
//  Created by Nikita Neluybin on 26.03.2021.
//

import UIKit

class SetupColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    //MARK: - Public Properties
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
        
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green

        mainView.layer.cornerRadius = 20
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setupSliderValue(for: redSlider, greenSlider, blueSlider)
        setupColor(for: mainView)
        setupValues(for: redLabel, greenLabel, blueLabel)
        setTextFieldValue(for: redTextField, greenTextField, blueTextField)
    }
    
    //MARK: - IB Actions
    @IBAction func doneButtonPressed() {
        delegate.setNewViewColor(from: mainView)
        dismiss(animated: true)
    }
    
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
        setTextFieldValue(for: redTextField, greenTextField, blueTextField)
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
    
    private func setTextFieldValue(for textFields: UITextField...) {
        textFields.forEach{ (textField) in
            switch textField.tag {
            case 0:
                redTextField.placeholder = convertValueToString(from: redSlider)
            case 1:
                greenTextField.placeholder = convertValueToString(from: greenSlider)
            default:
                blueTextField.placeholder = convertValueToString(from: blueSlider)
            }
        }
    }
    
    private func setupColor(for view: UIView) {
        view.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                       green: CGFloat(greenSlider.value),
                                       blue: CGFloat(blueSlider.value),
                                       alpha: 1)
    }
    
    private func setupSliderValue(for sliders: UISlider...) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        viewColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        sliders.forEach{ (slider) in
            switch slider {
            case redSlider:
                redSlider.value = Float(red)
            case greenSlider:
                greenSlider.value = Float(green)
            default:
                blueSlider.value = Float(blue)
            }
        }
    }

}

//MARK: - UITextFieldDelegate
extension SetupColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.value = currentValue
                setupValues(for: redLabel)
            case 1:
                greenSlider.value = currentValue
                setupValues(for: greenLabel)
            default:
                blueSlider.value = currentValue
                setupValues(for: blueLabel)
            }
            setupColor(for: mainView)
            return
        }
        
        showAlert(title: "Error", message: "Please enter correct value")
        textField.text = ""
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            greenTextField.becomeFirstResponder()
        case 1:
            blueTextField.becomeFirstResponder()
        default:
            view.endEditing(true)
        }
        return true
    }
}
