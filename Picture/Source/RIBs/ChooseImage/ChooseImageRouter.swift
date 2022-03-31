//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs

protocol ChooseImageInteractable: Interactable {
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ChooseImageInteractable, viewController: ChooseImageViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
