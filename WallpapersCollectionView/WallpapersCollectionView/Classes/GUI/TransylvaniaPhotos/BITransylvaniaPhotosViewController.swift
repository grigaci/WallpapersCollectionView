//
//  BITransylvaniaPhotosViewController.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 8/9/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import UIKit

class BITransylvaniaPhotosViewController: UICollectionViewController {
    let kCollectionViewCellID = NSStringFromClass(BITransylvaniaPhotosViewController.self)

    override init() {
        var layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        self.title = NSLocalizedString("Transylvania Photos", tableName: nil, bundle: NSBundle.mainBundle(), value: "Transylvania Photos", comment: "")
    }

    convenience required init(coder: NSCoder) {
        self.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellID)
    }

    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        var cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionViewCellID, forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }

}
