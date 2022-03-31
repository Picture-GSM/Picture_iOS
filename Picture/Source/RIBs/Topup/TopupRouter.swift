//
//  TopupRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
import UIUtil

protocol TopupInteractable: Interactable {
    var router: TopupRouting? { get set }
    var listener: TopupListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }

}

protocol TopupViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class TopupRouter: Router<TopupInteractable>, TopupRouting {
    
    private var navigationControllable : NavigationControllerable?

    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: TopupInteractable, viewController: ViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    //MARK: - Attach
    func attachCamera() {
        
    }
    func attachPhotoLibrary() {
        
    }
    
    
    //MARK: - Detach
    func detachCamera() {
        
    }
    func detachPhotoLibrary() {
        
    }
    
    // MARK: - Private

    private let viewController: ViewControllable
}
