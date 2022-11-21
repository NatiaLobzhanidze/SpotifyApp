//
//  TextfieldExtension.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import Foundation
import UIKit

let button = UIButton(type: .custom)
extension UITextField {
    
    func enablePasswordToggle(){
        
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        button.alpha = 0.9
        button.tintColor = .white
    }
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
    
  
}
