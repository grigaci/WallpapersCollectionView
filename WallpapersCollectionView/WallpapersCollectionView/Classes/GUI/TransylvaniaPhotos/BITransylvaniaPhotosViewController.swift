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
        layout.estimatedItemSize = CGSizeMake(100, 200)
        super.init(collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.title = BILocalizedString("Transylvania Photos")
    }

    convenience required init(coder: NSCoder) {
        self.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(BIPhotoCollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCellID)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:BIPhotoCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionViewCellID, forIndexPath: indexPath) as BIPhotoCollectionViewCell
        return cell
    }
}
