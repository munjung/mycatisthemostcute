//
//  PageViewController.swift
//  mycat
//
//  Created by MOONJUNG on 13/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class PageMainViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    //@IBOutlet weak var pageSubView: UIView!
    @IBOutlet weak var pageSubView: UIView!
    
    var pageVC: UIPageViewController!
    //var pageImages: Array<String>!
    var pageImages: [String]!
    var currentIdx:Int = 0
    var chooseIdx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageImages = ["ex01","ex02","ex03"]
        self.pageVC = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController//storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController//UIStoryboard(name: "popup", bundle: nil).instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        self.pageVC.dataSource = self
        self.pageVC.delegate = self
        
        let startVC = self.viewControllerAtIndex(index: chooseIdx) as PageContentViewController
        let viewControllers = NSArray(object: startVC)
        
        
        self.pageVC.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
        self.view.addSubview(pageSubView)
        self.addChild(self.pageVC)
        self.pageSubView.addSubview(self.pageVC.view)
        
        self.pageVC.view.translatesAutoresizingMaskIntoConstraints = false
//        self.pageSubView.addConstraint(NSLayoutConstraint(item: self.pageVC.view, attribute: .top, relatedBy: .equal, toItem: self.pageSubView, attribute: .top, multiplier: 1, constant: 0))
//        self.pageSubView.addConstraint(NSLayoutConstraint(item: self.pageVC.view, attribute: .left, relatedBy: .equal, toItem: self.pageSubView, attribute: .left, multiplier: 1, constant: 0))
//        self.pageSubView.addConstraint(NSLayoutConstraint(item: self.pageVC.view, attribute: .right, relatedBy: .equal, toItem: self.pageSubView, attribute: .right, multiplier: 1, constant: 0))
//        self.pageSubView.addConstraint(NSLayoutConstraint(item: self.pageVC.view, attribute: .bottom, relatedBy: .equal, toItem: self.pageSubView, attribute: .bottom, multiplier: 1, constant: 0))
        
    }
    
    func viewControllerAtIndex(index: Int) -> PageContentViewController {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageContentViewController else {
            return PageContentViewController()
        }
        vc.index = index
        vc.imgStr = self.pageImages[index]
        return vc
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageVC.viewControllers![0] as? PageContentViewController {
                currentIdx = currentViewController.index
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? PageContentViewController
        var index = vc!.index as Int
        
        if (index == 0 || index == NSNotFound){
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? PageContentViewController
        var index = vc!.index as Int
        
        if(index == NSNotFound){
            return nil
        }
        index += 1
        
        if(index == self.pageImages.count){
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return chooseIdx
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
