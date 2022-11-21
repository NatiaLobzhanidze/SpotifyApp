//
//  AuthButtonExtensions .swift
//  SpotifyApp
//
//  Created by Natia's Mac on 14.11.22.
//

import Foundation
import UIKit

extension UIButton {
    func authButton(with title: String, image: String) {
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named: image), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 0)
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
}
