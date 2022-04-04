//
//  DecideImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import RIBs

protocol DecideImageInteractable: Interactable {
    var router: DecideImageRouting? { get set }
    var listener: DecideImageListener? { get set }
}

protocol DecideImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DecideImageRouter: ViewableRouter<DecideImageInteractable, DecideImageViewControllable>, DecideImageRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DecideImageInteractable, viewController: DecideImageViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
