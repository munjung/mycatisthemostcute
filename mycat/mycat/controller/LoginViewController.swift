//
//  LoginViewController.swift
//  mycat
//
//  Created by MOONJUNG on 07/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {


//    @IBOutlet weak var logoLabel: UILabel!
//    @IBOutlet weak var logoLabel_2: UILabel!
    @IBOutlet weak var logoTitle: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.addSubview(logoLabel)
//        self.view.addSubview(logoLabel_2)
        self.view.addSubview(logoTitle)
        self.view.addSubview(logoImage)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(registerBtn)
        
        
       setLayout()
        
    }
    
    func setLayout(){
        
        /*let strokeTextAttributes = [ //232,165,75
            NSAttributedString.Key.strokeColor : UIColor(red: 232.0/255, green: 165.0/255, blue: 75.0/255, alpha: 1.0),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : 8.0]
            as [NSAttributedString.Key : Any]
        
        logoLabel.snp.makeConstraints { (make) in
            logoLabel.attributedText = NSMutableAttributedString(string: "우리집 고양이가", attributes: strokeTextAttributes)
            logoLabel.font = logoLabel.font.withSize(30)
            make.leading.equalTo(self.view).offset(25)
            make.trailing.equalTo(self.view).offset(-25)
            make.top.equalTo(self.view).offset(80)
        }
        logoLabel_2.snp.makeConstraints { (make) in
            logoLabel_2.attributedText = NSMutableAttributedString(string: "제일 귀여워", attributes: strokeTextAttributes)
            logoLabel_2.font = logoLabel_2.font.withSize(30)
            make.leading.equalTo(self.view).offset(25)
            make.trailing.equalTo(self.view).offset(-25)
            make.top.equalTo(self.logoLabel.snp_bottomMargin).offset(15)
        }*/
        logoTitle.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(70)
            make.trailing.equalTo(self.view).offset(-70)
            make.height.equalTo(150)
            make.top.equalTo(self.view.snp_topMargin).offset(15)
        }
        logoImage.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(200)
            make.top.equalTo(self.view.snp_topMargin).offset(80)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(logoImage.snp_bottomMargin).offset(0)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(idTextField.snp_bottomMargin).offset(25)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            loginBtn.layer.cornerRadius = 10.0
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(pwTextField.snp_bottomMargin).offset(25)
        }
        
        registerBtn.snp.makeConstraints { (make) in
            registerBtn.layer.cornerRadius = 10.0
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(-75)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
