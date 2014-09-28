//
//  BIModelManager.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 9/28/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import Foundation

class BIModelManager {
    let locationsCount = 2
    private var Bran: BILocation
    private var Sighisoara: BILocation

    class var sharedInstance : BIModelManager {
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : BIModelManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = BIModelManager()
        }
        return Static.instance!
    }
    
    init () {
        var branPhotos = BIModelManager.BranPhotoNames()
        self.Bran = BILocation(name: "Bran", photoNames: branPhotos)
        var sighisoaraPhotos = BIModelManager.SighisoaraPhotoNames()
        self.Sighisoara = BILocation(name: "Sighisoara", photoNames: sighisoaraPhotos)
    }

    func locationAtIndex(index: Int) -> BILocation? {
        var returnedLocation: BILocation?
        switch index {
        case 0:
            returnedLocation = self.Bran
        case 1:
            returnedLocation = self.Sighisoara
        default:
            returnedLocation = nil
        }
        return returnedLocation
    }

    class private func BranPhotoNames() -> NSArray! {
        var mutableArray = NSMutableArray()
        let countPhotos = 6
        for index in 1...countPhotos {
            var imageName = "Bran-\(index)"
            mutableArray.addObject(imageName)
        }
        return NSArray(array: mutableArray)
    }
    
    class private func SighisoaraPhotoNames() -> NSArray! {
        var mutableArray = NSMutableArray()
        let countPhotos = 7
        for index in 1...countPhotos {
            var imageName = "Sighisoara-\(index)"
            mutableArray.addObject(imageName)
        }
        return NSArray(array: mutableArray)
    }
}