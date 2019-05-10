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


    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(logoImage)
        self.view.addSubview(idTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(registerBtn)
        
       setLayout()
        
    }
    
    func setLayout(){
        logoImage.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(200)
            make.top.equalTo(self.view.snp_topMargin).offset(75)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(logoImage.snp_bottomMargin).offset(25)
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
