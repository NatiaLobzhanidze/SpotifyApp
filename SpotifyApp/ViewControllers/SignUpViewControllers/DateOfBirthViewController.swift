//
//  DateOfBirthViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import UIKit

class DateOfBirthViewController: BaseViewController {

    private let datePicker = UIDatePicker()
    private let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUp()
    }
    
    private func settingUp() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        createDatePicker()
        setUpView()
        let textfieldInput = "\(dateFormatter.string(from: .now))"
        setUpText(for: "What's your date of birth?", inFieldtext: textfieldInput)
        nextBtn.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
    }
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        field.textAlignment = .center
        field.inputView = datePicker
        field.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        field.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        isInteractionEnabled()
    }
    
    @objc func nextStep() {
        let vc = GenderViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
