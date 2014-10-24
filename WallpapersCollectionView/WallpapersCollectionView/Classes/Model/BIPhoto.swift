//
//  BIPhoto.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 9/28/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import UIKit
import ImageIO

class BIPhoto {
    let imageName: NSString!

    init (imageName: NSString!) {
        self.imageName = imageName
    }
    
    func thumbnail() -> UIImage! {
        let image = UIImage(named: self.imageName)
        let data = NSData(data: UIImageJPEGRepresentation(image, 0))
        let imageSource = CGImageSourceCreateWithData(data, nil)
        let scale = UIScreen.mainScreen().scale
        let pixelSize = String(kCGImageSourceThumbnailMaxPixelSize)
        let ifAbsent = String(kCGImageSourceCreateThumbnailFromImageIfAbsent)
        let maxSize = 150.0 / scale
        let options = [
            pixelSize : maxSize,
            ifAbsent : true
        ]

        let scaledImage = UIImage(CGImage: CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options))
        return scaledImage
    }
    
    func image() -> UIImage! {
        return UIImage(named: self.imageName)
    }
}