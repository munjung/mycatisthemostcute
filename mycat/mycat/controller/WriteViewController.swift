//
//  WriteViewController.swift
//  mycat
//
//  Created by MOONJUNG on 08/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class WriteViewController: UIViewController {
    
    var loadingActivity: UIActivityIndicatorView! // = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.loadingActivity = UIActivityIndicatorView()
        self.loadingActivity.isHidden = true
        
        setNavigationBar()
        setLayout()
        
        
    }
    
    
    @objc func backButtonClick() {
        //self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func okButtonClick() {
        if loadingActivity.isAnimating == true {
            loadingActivity.isHidden = true
            loadingActivity.stopAnimating()
        }else {
            loadingActivity.isHidden = false
            loadingActivity.startAnimating()
        }
       // self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @objc func add(){
        
    }
    
    func setNavigationBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0))
        let navItem = UINavigationItem(title: "글 쓰기")
        let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(backButtonClick))
        let okItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(okButtonClick))
        navItem.leftBarButtonItem = backItem
        navItem.rightBarButtonItem = okItem
        navBar.setItems([navItem], animated: false)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.backgroundColor = UIColor.white
        
        var items = [UIBarButtonItem]()
        
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append( UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add)) )
        toolBar.items = items
    }
    
    func setLayout(){
        self.view.addSubview(navBar)
        self.view.addSubview(toolBar)
        self.view.addSubview(loadingActivity)
        
        
        
        navBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(UIApplication.shared.statusBarFrame.size.height)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(80)
        }
        
        toolBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(50)
        }
        
        loadingActivity.snp.makeConstraints { (make) in
            loadingActivity.color = UIColor.yellow
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
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
