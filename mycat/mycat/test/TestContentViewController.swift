//
//  TestContentViewController.swift
//  mycat
//
//  Created by MOONJUNG on 13/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit
class TestContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var index: Int = 0
    var imgStr: String!
    var imageSize: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentImage = imgStr{
            imageView.image = UIImage(named: currentImage)
            self.imageSize = self.imageView.frame.height
            print(imageSize)
            //print(self.imageView.frame.height)
        }
        
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
