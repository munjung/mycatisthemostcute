//
//  PageContentViewController.swift
//  mycat
//
//  Created by MOONJUNG on 13/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var index: Int!
    var imgStr: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: imgStr)
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
