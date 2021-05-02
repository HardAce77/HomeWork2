//
//  MainViewController.swift
//  HomeWork2
//
//  Created by Nikita Neluybin on 29.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewViewColor(from view: UIView)
}
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setupColorVC = segue.destination as? SetupColorViewController else { return }
        setupColorVC.viewColor = self.view.backgroundColor
        setupColorVC.delegate = self
    }
}
extension MainViewController: SettingsViewControllerDelegate {
    func setNewViewColor(from view: UIView) {
        self.view.backgroundColor = view.backgroundColor
    }
}
