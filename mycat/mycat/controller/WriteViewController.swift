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
    var writeTextView: UITextView!
    var navBar: UINavigationBar!
    var placeholderLabel : UILabel!
    
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
        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0))
        let navItem = UINavigationItem(title: "글 쓰기")
        let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(backButtonClick))
        let okItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(okButtonClick))
        navItem.leftBarButtonItem = backItem
        navItem.rightBarButtonItem = okItem
        navBar.setItems([navItem], animated: false)

    }
    
    func setLayout(){

        writeTextView = UITextView()
    
        placeholderLabel = UILabel()
        placeholderLabel.text = "당신의 고양이를 마음껏 자랑해주세요~~~!"
        placeholderLabel.sizeToFit()
        placeholderLabel.font = placeholderLabel.font.withSize(18)
        
        self.view.addSubview(navBar)
        self.view.addSubview(loadingActivity)
        self.view.addSubview(writeTextView)
        self.writeTextView.addSubview(placeholderLabel)
        
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !writeTextView.text.isEmpty
        
        writeTextView.delegate = self
        writeTextView.isScrollEnabled = true
        writeTextView.font = .systemFont(ofSize: 15)
    
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        let spaceBar =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnDoneBar = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(self.backButtonClick))
        
        btnDoneBar.setBackgroundImage(UIImage(named: "camera_resize_30"), for: .normal, barMetrics: .default)
        toolBarKeyboard.items = [spaceBar, btnDoneBar]
        writeTextView.inputAccessoryView = toolBarKeyboard
        writeTextView.becomeFirstResponder()
        
        
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
            writeTextView.backgroundColor = UIColor.gray
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
