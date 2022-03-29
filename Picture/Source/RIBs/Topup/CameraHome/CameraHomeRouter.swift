//
//  CameraHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs

protocol CameraHomeInteractable: Interactable {
    var router: CameraHomeRouting? { get set }
    var listener: CameraHomeListener? { get set }
}

protocol CameraHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CameraHomeRouter: ViewableRouter<CameraHomeInteractable, CameraHomeViewControllable>, CameraHomeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CameraHomeInteractable, viewController: CameraHomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
