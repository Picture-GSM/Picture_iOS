//
//  PHAsset.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import PhotosUI
import Photos

extension PHAsset{
    func getAssetThumbnail(size : CGSize) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: self, targetSize: size, contentMode: .aspectFill, options: option, resultHandler: {(result, info) -> Void in
            thumbnail = result ?? UIImage()
        })
        return thumbnail
    }
    func getOrginalImage(complition:@escaping (UIImage) -> Void) {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var image = UIImage()
        manager.requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: option, resultHandler: {(result, info)->Void in
            image = result!
            
            complition(image)
        })
    }
    
    func getImageFromPHAsset() -> UIImage {
        var image = UIImage()
        let requestOptions = PHImageRequestOptions()
        requestOptions.resizeMode = PHImageRequestOptionsResizeMode.exact
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestOptions.isSynchronous = true
        
        if (self.mediaType == PHAssetMediaType.image) {
            PHImageManager.default().requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: requestOptions, resultHandler: { (pickedImage, info) in
                image = pickedImage ?? UIImage()
            })
        }
        return image
    }
}
