//
//  PhotoItem.swift
//  ChainPay
//
//  Created by Cobb on 2018/12/10.
//  Copyright © 2018 Beijing Link Chain Technologies Co.,Ltd. All rights reserved.
//

import UIKit
import Photos

class PhotoItem: NSObject {
    
    var targetView: UIView?
    
    var thumbImage: UIImage?
    
    var image: UIImage?
    
    var url: URL?
    
    var asset: PHAsset?
    
    var loadFinish = false
    
    override init() {
        super.init()
    }
    
    convenience init(WithTarget targetView: UIView,
                     thumbImage: UIImage? = nil,
                     image: UIImage? = nil,
                     url: URL? = nil,
                     asset: PHAsset? = nil) {
        self.init()
        self.targetView = targetView
        self.thumbImage = thumbImage
        self.image = image
        self.url = url
        self.asset = asset
    }
}
