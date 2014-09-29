//
//  BIPhotoViewController.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 9/29/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import UIKit

class BIPhotoViewController: UIViewController {
    lazy var imageView: UIImageView = {
        var tmpView = UIImageView()
        tmpView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return tmpView
    }()

    lazy var scrollView: UIScrollView = {
        var tmpView = UIScrollView()
        tmpView.setTranslatesAutoresizingMaskIntoConstraints(false)
        return tmpView
    }()

    var photo: BIPhoto? {
        didSet {
            if photo != nil {
                self.imageView.image = photo?.image()
            }
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init()
    }

    override func viewDidLoad () {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.scrollView);
        self.scrollView.addSubview(self.imageView);
        
        self.setupConstraintsScrollView()
        self.setupConstraintsImageView()
    }

    private func setupConstraintsScrollView() {
        let viewsDictionary = ["scrollView":self.scrollView]
        let constraints_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let constraints_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        self.view.addConstraints(constraints_H)
        self.view.addConstraints(constraints_V)
    }

    private func setupConstraintsImageView() {
        let viewsDictionary = ["imageView":self.imageView]
        let constraints_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let constraints_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|",
            options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        self.scrollView.addConstraints(constraints_H)
        self.scrollView.addConstraints(constraints_V)
    }
}
