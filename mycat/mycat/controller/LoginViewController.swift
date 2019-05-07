//
//  LoginViewController.swift
//  mycat
//
//  Created by MOONJUNG on 07/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerBtn.layer.cornerRadius = 10.0
        loginBtn.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
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
