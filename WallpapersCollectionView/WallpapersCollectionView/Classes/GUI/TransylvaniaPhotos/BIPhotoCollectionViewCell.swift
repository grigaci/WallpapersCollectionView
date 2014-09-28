//
//  BIPhotoCollectionViewCell.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 8/10/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import UIKit

class BIPhotoCollectionViewCell : UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        var tmpView = UIImageView()
        tmpView.image = UIImage(named: "Bran-1")
        tmpView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tmpView.contentMode = UIViewContentMode.ScaleAspectFit
        return tmpView
    }()

    lazy var label: UILabel = {
        var tmpView = UILabel()
        tmpView.text = "Un text foarte lung"
        tmpView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tmpView.backgroundColor = UIColor.purpleColor()
        return tmpView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentView.addSubview(self.imageView)
//        self.contentView.addSubview(self.label)
        self.setupConstraints()
//        self.setupConstraintsLabel()
        self.backgroundColor = UIColor.blueColor()
    }

    convenience required init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }

    func setupConstraints() {
        let viewsDictionary = ["imageView":imageView]
        let constraints_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imageView]-0-|",
                                  options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let constraints_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[imageView]-0-|",
                                  options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        self.contentView.addConstraints(constraints_H)
        self.contentView.addConstraints(constraints_V)
    }

    func setupConstraintsLabel() {
        let viewsDictionary = ["label":label]
        let constraints_H:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|",
                                  options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let constraints_V:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|",
                                  options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        self.contentView.addConstraints(constraints_H)
        self.contentView.addConstraints(constraints_V)
    }

}