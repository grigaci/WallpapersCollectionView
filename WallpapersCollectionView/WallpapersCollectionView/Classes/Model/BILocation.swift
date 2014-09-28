//
//  BILocation.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 9/28/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import Foundation

class BILocation {

    var name: NSString
    var photos: NSArray

    init (name: NSString, photoNames: NSArray! ) {
        self.name = name
        self.photos = NSArray()
        self.loadPhotos(photoNames)
    }

    private func loadPhotos(photoNames: NSArray!) {
        var mutableArray = NSMutableArray()
        
        for photoName in photoNames {
            var photo = BIPhoto(imageName: photoName as NSString)
            mutableArray.addObject(photo)
        }
        
        self.photos = NSArray(array: mutableArray)
    }
}