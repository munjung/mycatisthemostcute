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
    
    var loadingActivity: UIActivityIndicatorView!
    var writeTextView: UITextView!
    var navBar: UINavigationBar!
    var placeholderLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.loadingActivity = UIActivityIndicatorView()
        self.loadingActivity.isHidden = true
        self.loadingActivity.assignColor(UIColor(red: 241/255.0, green: 170/255.0, blue: 73/255.0, alpha: 1.0))
        self.loadingActivity.transform = CGAffineTransform(scaleX: 1, y: 1)
        setNavigationBar()
        setLayout()
    }
    
    @objc func backButtonClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func okButtonClick() {
        
        if self.loadingActivity.isAnimating == true {
            self.loadingActivity.isHidden = true
            self.loadingActivity.stopAnimating()
        }else {
            self.loadingActivity.isHidden = false
            self.loadingActivity.startAnimating()
        }
        
       DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
    
    func setNavigationBar(){
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0))
        let navItem = UINavigationItem(title: "글 쓰기")
        
        let backIcon = UIImage(named: "back")
        let backIconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 25, height: 25))
        let backButton = UIButton(frame: backIconSize)
        backButton.setBackgroundImage(backIcon, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        let backItem = UIBarButtonItem(customView: backButton)
        
        
        let checkIcon = UIImage(named: "check")
        let checkIconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 25, height: 25))
        let checkButton = UIButton(frame: checkIconSize)
        checkButton.setBackgroundImage(checkIcon, for: .normal)
        checkButton.addTarget(self, action: #selector(okButtonClick), for: .touchUpInside)
        let okItem = UIBarButtonItem(customView: checkButton)
        
        navItem.leftBarButtonItem = backItem
        navItem.rightBarButtonItem = okItem
        navBar.setItems([navItem], animated: false)

    }
    
    func setLayout(){

        writeTextView = UITextView()
        self.writeTextView.becomeFirstResponder()
        placeholderLabel = UILabel()
        placeholderLabel.text = "당신의 고양이를 마음껏 자랑해주세요!"
        placeholderLabel.sizeToFit()
        placeholderLabel.font = placeholderLabel.font.withSize(15)
        
        self.view.addSubview(navBar)
        self.view.addSubview(loadingActivity)
        self.view.addSubview(writeTextView)
        self.writeTextView.addSubview(placeholderLabel)
        
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !writeTextView.text.isEmpty
        
        writeTextView.delegate = self
        writeTextView.isScrollEnabled = true
        writeTextView.font = .systemFont(ofSize: 14)
    
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        let spaceBar =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnDoneBar = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(self.backButtonClick))
        
        btnDoneBar.setBackgroundImage(UIImage(named: "camera"), for: .normal, barMetrics: .default)
        toolBarKeyboard.items = [spaceBar, btnDoneBar]
        writeTextView.inputAccessoryView = toolBarKeyboard
        
        
        
        navBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(UIApplication.shared.statusBarFrame.size.height)
            make.width.equalTo(self.view.frame.size.width)
            make.height.equalTo(80)
        }
        
        writeTextView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.top.equalTo(self.navBar.snp_bottomMargin)
            make.height.equalTo(50)
            //writeTextView.backgroundColor = UIColor.gray
        }
        
        loadingActivity.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }

}

extension WriteViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

extension UIActivityIndicatorView {
    func assignColor(_ color: UIColor) {
        style = .whiteLarge
        self.color = color
    }
}
