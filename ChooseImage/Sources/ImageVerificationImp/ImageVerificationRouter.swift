//
//  ImageVerificationRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import ImageVerification

protocol ImageVerificationInteractable: Interactable {
    var router: ImageVerificationRouting? { get set }
    var listener: ImageVerificationListener? { get set }
}

protocol ImageVerificationViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ImageVerificationRouter: ViewableRouter<ImageVerificationInteractable, ImageVerificationViewControllable>, ImageVerificationRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ImageVerificationInteractable, viewController: ImageVerificationViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
