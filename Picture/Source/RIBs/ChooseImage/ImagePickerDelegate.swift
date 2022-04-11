//
//  ImagePickerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/05.
//

import UIKit
import RxSwift
//MARK: - Picker Delegate
public protocol ImagePickerDelegate: AnyObject{
    func imageDidSelect(_ image : UIImage)
    var originerState : Bool {get}
}
//MARK: - Button State 받음
public protocol ImageButtonSelectDelegate{
    var originerImageState : BehaviorSubject<Bool> {get}
    var pieceImageState : BehaviorSubject<Bool> {get}
}
public final class ImagePickerDelegateProxy : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImageButtonSelectDelegate{
    
    public var originerImageState = BehaviorSubject<Bool>(value: false)
    public var pieceImageState = BehaviorSubject<Bool>(value: false)
    
    
    public weak var delegate: ImagePickerDelegate?
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let possible = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            delegate?.imageDidSelect(possible)
        }else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            delegate?.imageDidSelect(possibleImage)
        }
        
        if delegate!.originerState{
            originerImageState.on(.next(true))
        }else{
            pieceImageState.on(.next(true))
        }
        
        picker.dismiss(animated: true)
    }
}

