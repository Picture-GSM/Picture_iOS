//
//  AlbumHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs

protocol AlbumHomeInteractable: Interactable {
    var router: AlbumHomeRouting? { get set }
    var listener: AlbumHomeListener? { get set }
}

protocol AlbumHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AlbumHomeRouter: ViewableRouter<AlbumHomeInteractable, AlbumHomeViewControllable>, AlbumHomeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AlbumHomeInteractable, viewController: AlbumHomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
