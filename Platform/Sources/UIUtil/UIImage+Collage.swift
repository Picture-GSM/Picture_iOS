//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/03.
//

import Foundation
import UIKit

public extension UIImage{
    func CropImage(image : UIImage) -> UIImage {
        let sideLength = min(image.size.width, image.size.height)
        let sourceSize = image.size
        let cropRect = CGRect(
            x: (sourceSize.width - sideLength) / 2.0,
            y: (sourceSize.height - sideLength) / 2.0,
            width: sideLength,
            height: sideLength
        ).integral
        
        let croppedImage = UIImage(
            cgImage: image.cgImage!.cropping(to: cropRect)!,
            scale: image.imageRendererFormat.scale,
            orientation: image.imageOrientation
        )
        
        return croppedImage
    }

}
