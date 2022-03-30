//
//  StoredImageDashboardRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs

protocol StoredImageDashboardInteractable: Interactable {
    var router: StoredImageDashboardRouting? { get set }
    var listener: StoredImageDashboardListener? { get set }
}

protocol StoredImageDashboardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class StoredImageDashboardRouter: ViewableRouter<StoredImageDashboardInteractable, StoredImageDashboardViewControllable>, StoredImageDashboardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: StoredImageDashboardInteractable, viewController: StoredImageDashboardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
