//
//  AuthViewController.swift
//  SpotifyApp
//
//  Created by Natia's Mac on 14.11.22.
//

import UIKit

class AuthViewController: UIViewController {
   
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isScrollEnabled = true
        return sv
        
    }()
    
    //contentView
    
    private let contentV = UIView()
    
     //view/imageview
    private let backImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "authImage")
        
        return i
    }()
       ///imageview
    private  var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(named: "spotifyLogo")
        i.tintColor = .white
        i.setDimensions(height: 30, width: 30)
        
        return i
    }()
        /// lable
    private var authTextLb: UILabel = {
        let lb = UILabel()
        lb.text = "Milions of songs. \n Free on Spotify."
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
        
    }()
    
    private let midView = UIView()
 
    // sign up
    private let signUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign up free", for: .normal)
        btn.backgroundColor = .green
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(nextBtn), for: .touchUpInside)
        return btn
    }()
    
    //google btn
    private let googleBtn: UIButton = {
        let btn = UIButton()
        btn.authButton(with: "Continue with Google", image: "google16")
        return btn
    }()
    //fbbtn
    
    private let facebookBtn: UIButton = {
        let btn = UIButton()
        btn.authButton(with: "Continue with facebook", image: "facebook16")
        return btn
    }()
    
    //apple
    private let appleBtn: UIButton = {
        let btn = UIButton()
        btn.authButton(with: "Continue with Apple", image: "apple16")
        btn.tintColor = .white
        return btn
    }()
    
    //Log in
    
    private let logInBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log in", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setUpView() {
        self.view.backgroundColor = .black
        setUpScrollview()
        contentV.addSubview(backImage)
        backImage.anchor(top: contentV.topAnchor, left: contentV.leftAnchor,  right: contentV.rightAnchor, paddingTop: 0, paddingLeft: 0,  paddingRight: 0,height: UIScreen.main.bounds.height/2.2)
        addMidView()
        addBtnStackView()
    }
    
    private func setUpScrollview() {
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.addSubview(contentV)
        contentV.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        contentV.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
       
    }
    
    private func addMidView() {
        let lb = UILabel()
        let lb2 = UILabel()
        lb2.text = "Free on Spotify."
        lb2.textColor = .white
        lb2.textAlignment = .center
        
        lb2.font = UIFont.systemFont(ofSize: 20)
        lb.text = "Milions of songs."
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 20)
        midView.addSubview(logoImage)
        logoImage.anchor(top: midView.topAnchor,  paddingTop: 30, width: 100, height: 100)
        logoImage.centerX(inView: midView)
        midView.addSubview(lb)
        lb.anchor(top: logoImage.bottomAnchor,  left: midView.leftAnchor, right: midView.rightAnchor, paddingTop: 10, paddingLeft: 30,  paddingRight: 30, height: 35)
        midView.addSubview(lb2)
        lb2.anchor(top: lb.bottomAnchor,  left: midView.leftAnchor, right: midView.rightAnchor, paddingTop: 10, paddingLeft: 30,  paddingRight: 30, height: 35)
        backImage.addSubview(midView)
        midView.anchor( left: backImage.leftAnchor, bottom: backImage.bottomAnchor, right: backImage.rightAnchor, paddingBottom: 0, height: 100)
        midView.centerX(inView: backImage)
    }
    
    private func addBtnStackView() {
        let stackview = UIStackView(arrangedSubviews: [signUpBtn, googleBtn, facebookBtn, appleBtn, logInBtn])
        stackview.axis = .vertical
        stackview.spacing = 5
        stackview.distribution = .fillEqually
        contentV.addSubview(stackview)
        stackview.anchor(top: backImage.bottomAnchor, left: contentV.leftAnchor, bottom: contentV.bottomAnchor, right: contentV.rightAnchor, paddingTop: 70, paddingLeft: 30, paddingBottom: 20, paddingRight: 30,  height:  UIScreen.main.bounds.height/2 - 100)
    }
    
    //MARK: Objc methods
    @objc func nextBtn(_ sender: UIButton) {
        let vc = CreateUserViewController()
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
