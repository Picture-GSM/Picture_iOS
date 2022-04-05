//
//  UIImageView+Util.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import UIKit
import Photos

extension UIImageView{
    func fetchImage(asset: PHAsset, contentMode : PHImageContentMode, targetSize : CGSize){
        let options = PHImageRequestOptions()
        options.version = .original
        PHImageManager.default().requestImage(
            for: asset,
            targetSize: targetSize,
            contentMode: contentMode,
            options: options) { image, _ in
                guard let image = image else {return}
                self.contentMode = .scaleAspectFill
                self.image = image
            }
    }
}

