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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout();
    }
    
    func setLayout(){
        
    }

}

extension MypageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MypageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifler, for: indexPath) as! MypageCollectionViewCell
//        cell.catImages.image = images[indexPath.item]
//        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    
}
