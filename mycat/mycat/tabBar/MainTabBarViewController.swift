//
//  MainTabBarViewController.swift
//  mycat
//
//  Created by MOONJUNG on 08/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    var contentViewController: ContentViewController!
    var writeViewController: WriteViewController!
    var mypageViewController: MypageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let tabBarItems = tabBar.items! as [UITabBarItem]
        tabBarItems[0].title = nil
        tabBarItems[0].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        tabBarItems[1].title = nil
        tabBarItems[1].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        tabBarItems[2].title = nil
        tabBarItems[2].imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        
        /*self.contentViewController = ContentViewController()
        self.writeViewController = WriteViewController()
        self.mypageViewController = MypageViewController()
        self.contentViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        self.writeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.mypageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)*/
        
//        self.writeViewController.tabBarItem.image = UIImage(named: "smallicon")
//        self.writeViewController.tabBarItem.selectedImage =
//            UIImage(named: "smallicon")
    
        
       /*
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        let viewControllersList = [contentViewController,writeViewController,mypageViewController]
        self.viewControllers = (viewControllersList as! [UIViewController])
        */
        
    }
    

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if (viewController.nibName == "Wkv-aN-ewM-view-CFI-dD-Q1X"){
            let vc = WriteViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        }
        

        /*if viewController.isKind(of: WriteViewController.self) {
            let vc =  WriteViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
        }*/
        return true

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
