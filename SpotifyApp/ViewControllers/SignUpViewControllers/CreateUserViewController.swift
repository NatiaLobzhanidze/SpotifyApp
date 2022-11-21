//
//  CreateUserViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import UIKit

final class CreateUserViewController: BaseViewController {
    
    //counter
    
    var counter = 0 {
        didSet {
            // change text in labels
            switch counter {
            case 0:
                fieldTitle.text = "What is your email?"
                subText.text = "You'll need to conffirm this email later."
            case 1 :
                fieldTitle.text = "Create password"
                subText.text = "Use at least 8 characters"
            case 2 :
                fieldTitle.text = "Chose gender"
                subText.text = "Use at least 8 characters"
            case 3:
                counter = 0
                fieldTitle.text = "What is your email?"
                subText.text = "You'll need to conffirm this email later."
            default:
                print("other")
            }
        }
    }
    //view
    private  var horizontalView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var secondHorizontalView:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPrivateView()
    }
    
    private func setUpPrivateView() {
        view.addSubview(horizontalView)
        view.addSubview(secondHorizontalView)
        
        horizontalView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10,  paddingRight: 10,  height: UIScreen.main.bounds.height/3)
        
//        secondHorizontalView.anchor(top: horizontalView.topAnchor, left: horizontalView.leftAnchor, bottom: horizontalView.bottomAnchor, right: horizontalView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        horizontalView.addSubview(fieldTitle)
        fieldTitle.anchor(top: horizontalView.topAnchor, left: horizontalView.leftAnchor,  paddingTop: 10, paddingLeft: 10,  height: 35)
        horizontalView.addSubview(field)
        field.anchor(top: fieldTitle.bottomAnchor, left: fieldTitle.leftAnchor,  right: horizontalView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 10,  height: 45)
        horizontalView.addSubview(subText)
        subText.anchor(top: field.bottomAnchor, left: field.leftAnchor, bottom: horizontalView.bottomAnchor, right: field.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 15, paddingRight: 0)
        nextBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(nextBtn)
        nextBtn.centerX(inView: view)
        nextBtn.anchor(top: horizontalView.bottomAnchor, paddingTop: 30, width: 100, height: 50)
        isInteractionEnabled()
//        setUpView()
//        setUpText(for: "What's your email?", fieldPlaceHolder: "Enter your email", subText: "You'll need to conffirm this email later.")
//        nextBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
//        field.addTarget(self, action: #selector(textfieldDidChanged), for: .editingChanged)
    }
    
    func moveRight(view: UIView) {
        view.center.x += UIScreen.main.bounds.width
    }
    
    func moveLeft(view: UIView) {
        view.center.x = self.view.center.x
    }
    
    @objc func nextPage() {
        counter += 1
        let duration: Double = 0.5
        UIView.animate(withDuration: duration, animations: {
            self.moveRight(view: self.horizontalView)
        }) {(finished) in
            if finished {
print("finished")
                
//                UIView.animate(withDuration: 0.1, delay: 0.25, options: [], animations: {
//                    self.moveLeft(view: self.horizontalView)
//                    self.field.text = ""
//                }, completion: nil)
            }
        }
    }
        //check mail
//        sumVc.textFieldText = field.text ?? "user name"
//            let vc = CreatePasswordViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
    
    
    @objc func textfieldDidChanged() {
        guard let input = field.text else { return }
        //switch conditions
        if input.contains("@") {
            isInteractionEnabled()
        } else {
            isNotInteractionEnabled()
        }
    }
}
