//
//  CreatePasswordViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import UIKit

class CreatePasswordViewController: BaseViewController, UITextFieldDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        settingUpView()
    }
    
    private func settingUpView() {
        field.enablePasswordToggle()
        nextBtn.backgroundColor = .darkGray
        setUpView()
        setUpText(for: "Create password", fieldPlaceHolder: "password", subText: "Use at least 8 characters")
        field.addTarget(self, action: #selector(textfieldDidChanged), for: .editingChanged)
        nextBtn.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
    }
    
    @objc func textfieldDidChanged() {
        guard let input = field.text?.count else { return }
        //switch conditions
        if input >= 8 {
            isInteractionEnabled()
        } else {
            isNotInteractionEnabled()
        }
    }
    @objc func nextStep() {
        let vc = DateOfBirthViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
