//
//  GenderViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import UIKit

class GenderViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    private let pickerView = UIPickerView()
    private let genders = ["Femail", "Mail", "Non-binary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        settingUp()
    }
    

    
    private func settingUp() {
        field.inputView = pickerView
        setUpView()
        setUpText(for: "What's your gender?", inFieldtext: "Choose Gender")
        
        setUpPicker()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       // TODO: - Specify index what you need. After editing it changed and you should get selected index using its position in platformData Array
       let index = 0
       pickerView.selectRow(index, inComponent: 0, animated: true)
    }
   private func addToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
       toolbar.setItems([doneButton], animated: true)
       return toolbar
    }

    @objc func donePressed() {
        field.inputView = pickerView
      
        view.endEditing(true)
        isInteractionEnabled()
  }
    
    func setUpPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .lightGray
        field.inputView = pickerView
        field.inputAccessoryView = addToolBar()
        pickerView.selectRow(0, inComponent: 0, animated: true)

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.field.text = genders[row]
        
    }

    @objc func nextStep() {
        let vc = SummeryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
