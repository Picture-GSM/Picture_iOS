//
//  AdaptivePresentationControllerDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/15.
//

import UIKit

public protocol AdaptivePresentationControllerDelegate: AnyObject{
    func presetationControllerDidDismiss()
}

public final class AdaptivePresentationControllerDelegateProxy : NSObject, UIAdaptivePresentationControllerDelegate{
    
    public weak var delegate: AdaptivePresentationControllerDelegate?
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        delegate?.presetationControllerDidDismiss()
    }
}

