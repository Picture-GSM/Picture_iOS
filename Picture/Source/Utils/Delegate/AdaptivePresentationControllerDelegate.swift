//
//  AdaptivePresentationControllerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/15.
//

import UIKit

protocol AdaptivePresentationControllerDelegate: AnyObject{
    func presetationControllerDidDismiss()
}

final class AdaptivePresentationControllerDelegateProxy : NSObject, UIAdaptivePresentationControllerDelegate{
    
    weak var delegate: AdaptivePresentationControllerDelegate?
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        delegate?.presetationControllerDidDismiss()
    }
}

