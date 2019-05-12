//
//  TestMainViewController.swift
//  mycat
//
//  Created by MOONJUNG on 13/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit

class TestMainViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    var pageViewController: UIPageViewController?
    var images = ["ex01","ex02","ex03"]
    var pendingIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.numberOfPages = images.count
        createPageViewController()
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
        self.addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.view.addSubview(pageControl)
        pageViewController!.didMove(toParent: self)
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
