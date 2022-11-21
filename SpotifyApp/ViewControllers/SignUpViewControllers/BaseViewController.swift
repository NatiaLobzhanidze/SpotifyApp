//
//  BaseViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 15.11.22.
//

import UIKit

class BaseViewController: UIViewController {

    //textLable
    
     let fieldTitle: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        lb.textColor = .white
       
        return lb
    }()
    
    //textfield
    let field: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        let space = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        tf.bounds.inset(by: space)
  
        tf.backgroundColor = .darkGray
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    //textlb
    let subText: UILabel = {
        let st = UILabel()
        st.font = UIFont.systemFont(ofSize: 13)
        st.textColor = .white
        st.backgroundColor = .black
       
        return st
    }()
    
    //button
     let nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .darkGray
         btn.isUserInteractionEnabled = false
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure() {
        title = "Create account"
        setUpView()
        
    }
    
     func setUpView() {
        view.backgroundColor = .black
         self.navigationController?.navigationBar.topItem?.title = ""
        setUpUIElements()
    }
    
    private func setUpUIElements() {
        view.addSubview(fieldTitle)
        
        fieldTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 5,
                          paddingLeft: 15,
                          height: 40)
        
        view.addSubview(field)
        field.anchor(top: fieldTitle.bottomAnchor, left: fieldTitle.leftAnchor,  right: view.rightAnchor, paddingTop: 5, paddingLeft: 0,  paddingRight: 15,  height: 50)
        view.addSubview(subText)
        subText.anchor(top: field.bottomAnchor, left: field.leftAnchor, right: field.rightAnchor, paddingTop: 0, paddingLeft: 0,  paddingRight: 0,  height: 20)
        view.addSubview(nextBtn)
        nextBtn.anchor(top: subText.bottomAnchor,  paddingTop: 40,  width: 100, height: 45)
        nextBtn.centerX(inView: view)
    }
    
    func setUpText(for fieldTitle: String, inFieldtext: String? = nil,  fieldPlaceHolder: String? = nil, subText: String? = nil) {
        self.fieldTitle.text = fieldTitle
      
        self.subText.text = subText
        guard let inFieldtext = inFieldtext else {
            self.field.placeholder = fieldPlaceHolder
            return
        }
        self.field.text = inFieldtext
    
    }
    
     func isNotInteractionEnabled() {
        nextBtn.isUserInteractionEnabled = false
        nextBtn.backgroundColor = .darkGray
    }
    
     func isInteractionEnabled() {
        nextBtn.isUserInteractionEnabled = true
        nextBtn.backgroundColor = .white
    }
    
}

