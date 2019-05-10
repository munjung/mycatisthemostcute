//
//  RegisterViewController.swift
//  mycat
//
//  Created by MOONJUNG on 07/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var idcheckBtn: UIButton!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var isUsableLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(profileImage)
        self.view.addSubview(idTextField)
        self.view.addSubview(idcheckBtn)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pwCheckTextField)
        self.view.addSubview(nickNameTextField)
        self.view.addSubview(isUsableLabel)
        self.view.addSubview(registerBtn)
        
        setLayout()
    }
    
    func setLayout(){
        
        profileImage.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.snp_topMargin).offset(75)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.height.equalTo(45)
            make.top.equalTo(profileImage.snp_bottomMargin).offset(25)
        }
        
        idcheckBtn.snp.makeConstraints { (make) in
            idcheckBtn.layer.cornerRadius = 10.0
            make.leading.equalTo(idTextField.snp_trailingMargin).offset(15)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(profileImage.snp_bottomMargin).offset(25)
        }
        
        pwTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(idTextField.snp_bottomMargin).offset(25)
        }
        
        pwCheckTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(pwTextField.snp_bottomMargin).offset(25)
        }
        
        nickNameTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(45)
            make.top.equalTo(pwCheckTextField.snp_bottomMargin).offset(25)
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
