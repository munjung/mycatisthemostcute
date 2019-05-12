//
//  UserContentViewController.swift
//  mycat
//
//  Created by MOONJUNG on 12/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit
class UserContentViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var contents:[Content] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentScrollView.delegate = self
        contents = createSlides()
        setupSlideScrollView(contents: contents)
        pageControl.numberOfPages = contents.count
        pageControl.currentPage = 0
        
        self.view.bringSubviewToFront(pageControl)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func createSlides() -> [Content] {
        
        let slide1:Content = Bundle.main.loadNibNamed("Content", owner: self, options: nil)?.first as! Content
        slide1.contentImages.image = UIImage(named: "ex01")
        
        let slide2:Content = Bundle.main.loadNibNamed("Content", owner: self, options: nil)?.first as! Content
        slide2.contentImages.image = UIImage(named: "ex02")
        
        let slide3:Content = Bundle.main.loadNibNamed("Content", owner: self, options: nil)?.first as! Content
        slide3.contentImages.image = UIImage(named: "ex03")
        
        let slide4:Content = Bundle.main.loadNibNamed("Content", owner: self, options: nil)?.first as! Content
        slide4.contentImages.image = UIImage(named: "ex04")
        
        let slide5:Content = Bundle.main.loadNibNamed("Content", owner: self, options: nil)?.first as! Content
        slide5.contentImages.image = UIImage(named: "ex05")
        
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func setupSlideScrollView(contents : [Content]) {
        //contentScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        contentScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(contents.count), height: view.frame.height)
        contentScrollView.isPagingEnabled = true
        
        for i in 0 ..< contents.count {
            contents[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            contentScrollView.addSubview(contents[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        /*
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
       if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            contents[0].contentImages.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            contents[1].contentImages.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            contents[1].contentImages.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            contents[2].contentImages.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            contents[2].contentImages.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            contents[3].contentImages.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            contents[3].contentImages.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            contents[4].contentImages.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }*/
    }

}
