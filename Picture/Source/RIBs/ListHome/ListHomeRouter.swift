//
//  ListHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs

protocol ListHomeInteractable: Interactable {
    var router: ListHomeRouting? { get set }
    var listener: ListHomeListener? { get set }
}

protocol ListHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ListHomeRouter: ViewableRouter<ListHomeInteractable, ListHomeViewControllable>, ListHomeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ListHomeInteractable, viewController: ListHomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
