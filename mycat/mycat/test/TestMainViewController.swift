//
//  TestMainViewController.swift
//  mycat
//
//  Created by MOONJUNG on 13/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class TestMainViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userComment: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var pageViewController: UIPageViewController?
    var images = ["ex01","ex02","ex03"]
    var pendingIndex: Int?
    var comment: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.numberOfPages = images.count
        createPageViewController()
        self.scrollView.delegate = self
        self.scrollView.isDirectionalLockEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func getContentViewController(withIndex index: Int) -> TestContentViewController? {
        if index < images.count {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentVC") as? TestContentViewController
            contentVC?.index = index
            contentVC?.imgStr = images[index]
            return contentVC
        }
        return nil
    }
    
    func createPageViewController(){
        let pageController = self.storyboard?.instantiateViewController(withIdentifier: "pageVC") as! UIPageViewController
        pageController.dataSource = self
        pageController.delegate = self as! UIPageViewControllerDelegate
        
        if images.count > 0{
            let contentController = getContentViewController(withIndex: 0)
            let contentControllers = [contentController]
            
            pageController.setViewControllers(contentControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewController = pageController
        
        self.view.addSubview(scrollView)
//        self.scrollView.addSubview(pageViewController!.view)
//        self.scrollView.addSubview((pageControl))
//        self.scrollView.addSubview(closeBtn)
//        self.scrollView.addSubview(stackView)
//        self.scrollView.addSubview(userComment)
        
        
        self.view.addSubview(pageViewController!.view)
        self.view.addSubview(pageControl)
        self.addChild(pageViewController!)
        self.view.addSubview(closeBtn)
        self.view.addSubview(stackView)
        self.view.addSubview(userComment)
        //self.scrollView.addSubview(userComment)
//        self.view.addSubview(userComment)
        
        pageViewController!.view.snp.makeConstraints { (make) in
            make.top.left.width.equalTo(self.view)
            make.height.equalTo(self.view.frame.height*8/9)
        }
        
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(UIApplication.shared.statusBarFrame.size.height + 20)//.offset(10)
            make.right.equalTo(self.view.snp_rightMargin).offset(-15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(50)
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(self.view)
            //scrollView.contentSize = self.view.bounds.size
        }
        stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            //print(pageViewController!.view.frame.height)
            //print(pageViewController!.preferredContentSize.height)
            //print(pageViewController!.view.frame.height)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(-self.view.frame.height/6)
            make.height.equalTo(30)
        }
        
        userComment.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(self.stackView.snp_bottomMargin).offset(10)
            self.userComment.text = self.comment
            self.userComment.lineBreakMode = .byCharWrapping
            self.userComment.numberOfLines = 0
            
            /*if (comment.count) > 50 {
                //let range = comment.index(after: comment.startIndex)..<comment.endIndex
                //let range = comment.index(comment.startIndex, offsetBy: 10)..<comment.endIndex
                let range = comment.index(comment.startIndex, offsetBy: 0)..<comment.index(comment.endIndex, offsetBy: -30)
                self.userComment.text = String(comment[range])
            }else {
                self.userComment.text = self.comment
            }*/
        }
        
        pageViewController!.didMove(toParent: self)
    }
    
    @IBAction func closeBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension TestMainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! TestContentViewController
        
        if contentVC.index > 0 {
            return getContentViewController(withIndex: contentVC.index - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! TestContentViewController
        if contentVC.index + 1 < images.count {
            return getContentViewController(withIndex: contentVC.index + 1)
        }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = (pendingViewControllers.first as! TestContentViewController).index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            let currentIndex = pendingIndex
            if let index = currentIndex {
                print(index)
                self.pageControl.currentPage = index
            }
        }
    }
    
}
