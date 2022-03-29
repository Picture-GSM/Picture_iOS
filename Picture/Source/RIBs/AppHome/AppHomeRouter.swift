//
//  AppHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RIBsUtil
import UIUtil

protocol AppHomeInteractable: Interactable ,TopupListener {
    var router: AppHomeRouting? { get set }
    var listener: AppHomeListener? { get set }
}

protocol AppHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppHomeRouter: ViewableRouter<AppHomeInteractable, AppHomeViewControllable>, AppHomeRouting {

    
    
    private let topupBuildable : TopupBuildable
    private var topupRouting : Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AppHomeInteractable,
         viewController: AppHomeViewControllable,
         topupBuildable : TopupBuildable
    ){
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachTopup(btnState: btnOption) {
        if topupRouting != nil{
            return
        }
        let router = topupBuildable.build(withListener: interactor)
        topupRouting = router
        attachChild(router)
    }
    //MARK: - Detach
    func detachTopup() {
        guard let router = topupRouting else{
            return
        }
        detachChild(router)
        self.topupRouting = nil
    }
}
