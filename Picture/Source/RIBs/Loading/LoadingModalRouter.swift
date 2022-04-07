//
//  LoadingModalRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import UIUtil

protocol LoadingModalInteractable: Interactable {
    var router: LoadingModalRouting? { get set }
    var listener: LoadingModalListener? { get set }
}

protocol LoadingModalViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoadingModalRouter: ViewableRouter<LoadingModalInteractable, LoadingModalViewControllable>, LoadingModalRouting {

    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(
        interactor: LoadingModalInteractable,
        viewController: LoadingModalViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
