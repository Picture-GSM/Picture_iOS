//
//  ImageFileManager.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import Foundation
import UIKit
import Photos
//MARK: - Photo save inside Album
class ImageManager{
    static let shared: ImageManager = ImageManager()
    
    func saveImage(image : UIImage){
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized else {return}
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            },completionHandler: nil)
        }
    }
}
