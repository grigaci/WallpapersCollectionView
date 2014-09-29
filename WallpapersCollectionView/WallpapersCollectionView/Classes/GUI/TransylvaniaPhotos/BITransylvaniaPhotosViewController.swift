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
        layout.estimatedItemSize = CGSizeMake(100, 100)
        layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20)
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

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return BIModelManager.sharedInstance.locationsCount
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var location = BIModelManager.sharedInstance.locationAtIndex(section)
        var countPhotos = (location != nil) ? location?.photos.count : 0
        return countPhotos!
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:BIPhotoCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionViewCellID, forIndexPath: indexPath) as BIPhotoCollectionViewCell
        
        var location = BIModelManager.sharedInstance.locationAtIndex(indexPath.section)
        var photo = location?.photos.objectAtIndex(indexPath.row) as BIPhoto
        cell.photo = photo
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var cell:BIPhotoCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as BIPhotoCollectionViewCell
        var photoViewController: BIPhotoViewController = BIPhotoViewController(nibName: nil, bundle: nil)

        // Set photo
        photoViewController.photo = cell.photo

        // Set title
        var location = BIModelManager.sharedInstance.locationAtIndex(indexPath.section)
        photoViewController.title = location?.name

        // Push it on nav stack
        self.navigationController?.pushViewController(photoViewController, animated: true)
    }
}
