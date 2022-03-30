//
//  PageDashboardRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs

protocol PageDashboardInteractable: Interactable {
    var router: PageDashboardRouting? { get set }
    var listener: PageDashboardListener? { get set }
}

protocol PageDashboardViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class PageDashboardRouter: ViewableRouter<PageDashboardInteractable, PageDashboardViewControllable>, PageDashboardRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: PageDashboardInteractable, viewController: PageDashboardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
