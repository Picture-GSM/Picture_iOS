//
//  ImagePickerControllerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import UIKit

public protocol ImagePickerControllerDelegate: AnyObject{
    func imageDidFinishPicking(image : UIImage)
}

public final class ImagePickerControllerDelegateProxy : NSObject, UIImagePickerControllerDelegate, UINavigationBarDelegate{
    
    public weak var delegate: ImagePickerControllerDelegate?
    

    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            delegate?.imageDidFinishPicking(image: image)
        }
    }

}
