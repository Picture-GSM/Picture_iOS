//
//  ImagePickerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/05.
//

//import UIKit
//import RxSwift
////MARK: - Picker Delegate
//public protocol ImagePickerDelegate: AnyObject{
//    func pieceImageSelect(_ image : UIImage)
//    func originerImageSelect(_ image : UIImage)
//    var originerState : Bool {get}
//}
//public final class ImagePickerDelegateProxy : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//    
//    
//    public weak var delegate: ImagePickerDelegate?
//    
//    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        
//        var image : UIImage? = nil
//        
//        if let possible = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
//            image = possible
//        }else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            image = possibleImage
//        }
//        
//        if delegate!.originerState{
//            delegate?.originerImageSelect(image ?? UIImage())
//        }else{
//            delegate?.pieceImageSelect(image ?? UIImage())
//        }
//        
//        picker.dismiss(animated: true)
//    }
//}
//
