//
//  SummeryViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 16.11.22.
//

import UIKit

class SummeryViewController: BaseViewController {
    var textFieldText = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpText(for: "What's yout name?",inFieldtext: textFieldText,  subText: "This appears on your Spotify profile")

    }

}
