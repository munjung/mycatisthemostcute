//
//  ContentViewController.swift
//  mycat
//
//  Created by MOONJUNG on 08/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class ContentViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifler: String  = "ContentCell"
    let images = [
        UIImage(named: "ex02"), UIImage(named: "ex01"),UIImage(named: "ex03"),UIImage(named: "ex04"),UIImage(named: "ex05")
    ,UIImage(named: "ex06"),UIImage(named: "ex07"),UIImage(named: "ex08"),UIImage(named: "ex09"),UIImage(named: "ex10")
    ]
    
    let userimages = [UIImage(named: "user"),UIImage(named: "main_cat"),UIImage(named: "main_cat")
    ,UIImage(named: "main_cat"),UIImage(named: "main_cat"),UIImage(named: "main_cat"),
     UIImage(named: "main_cat"),UIImage(named: "main_cat"),UIImage(named: "main_cat"),UIImage(named: "main_cat")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.height.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
 
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

extension ContentViewController:PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.row]
        let height = image?.size.height
        return height!

    }

}

//extension ContentViewController:UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfColumns: CGFloat = 2
//        let width = collectionView.frame.size.width
//        let xInsets: CGFloat = 10
//        let cellSpacing:CGFloat = 5
//        let image = images[indexPath.row]
//        let height = image!.size.height
//        return CGSize(width: (width/numberOfColumns)-(xInsets+cellSpacing), height: height)
//    }
//}
extension ContentViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifler, for: indexPath) as! ContentCollectionViewCell
        cell.catImages.image = images[indexPath.item]
        cell.layer.cornerRadius = 10.0
        
        return cell
    }
}
