//
//  BIConstants.swift
//  WallpapersCollectionView
//
//  Created by Bogdan Iusco on 8/9/14.
//  Copyright (c) 2014 Grigaci. All rights reserved.
//

import Foundation

func BILocalizedString(text: String) -> String {
    return NSLocalizedString(text, tableName: nil, bundle: NSBundle.mainBundle(), value: text, comment: "")
}
