//
//  MypageViewController.swift
//  mycat
//
//  Created by MOONJUNG on 08/05/2019.
//  Copyright © 2019 MOONJUNG. All rights reserved.
//

import UIKit
import SnapKit

class MypageViewController: UIViewController {
    
    let cellIdentifler: String  = "mypageCell"

    @IBOutlet weak var mypageCollectionView: UICollectionView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    let image = [[
         UIImage(named: "ex02"), UIImage(named: "ex01"),UIImage(named: "ex03"),UIImage(named: "ex04"),UIImage(named: "ex05")],
                 [
        UIImage(named: "ex06"), UIImage(named: "ex08"),UIImage(named: "ex09"),UIImage(named: "ex07"),UIImage(named: "ex10")
        ]]
    var p: Int!
    
    var sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 8.0,
                                             bottom: 50.0,
                                             right: 8.0)
    
    var itemsPerRow: CGFloat = 3

    
    override func viewDidLoad() {
        super.viewDidLoad()
        p = 0
        self.view.addSubview(userImageView)
        self.view.addSubview(segmentControl)
        setLayout();
    }
    
    func setLayout(){
        userImageView.snp.makeConstraints { (make) in
            userImageView.setRounded()
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(self.view.frame.height/10)
            userImageView.image = UIImage(named: "user")
        }
        
        segmentControl.snp.makeConstraints { (make) in
            segmentControl.tintColor = UIColor.orange
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(40)
            make.top.equalTo(self.userImageView.snp_bottomMargin).offset(30)
        }
        
        mypageCollectionView.snp.makeConstraints { (make) in
            //mypageCollectionView.backgroundColor = UIColor.black
            make.width.equalTo(self.view)
//            make.leading.equalTo(10)
//            make.trailing.equalTo(-10)
            make.height.equalTo(self.view)
            make.top.equalTo(self.segmentControl.snp_bottomMargin).offset(10)
        }
    }
    
    
    @IBAction func segmentContorolClick(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        self.mypageCollectionView.reloadData()
    }
    
}

extension MypageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image[p].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MypageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifler, for: indexPath) as! MypageCollectionViewCell
        cell.imageView.image = image[p][indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //self.navigationController?.pushViewController(TestMainViewController(), animated: true)
//        self.present(TestMainViewController(), animated: true, completion: nil)
//    }
    
    
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
