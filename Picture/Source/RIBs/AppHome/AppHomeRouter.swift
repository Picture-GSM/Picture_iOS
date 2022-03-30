//
//  AppHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RIBsUtil
import UIUtil

protocol AppHomeInteractable: Interactable ,TopupListener, AlbumHomeListener{
    var router: AppHomeRouting? { get set }
    var listener: AppHomeListener? { get set }
}

protocol AppHomeViewControllable: ViewControllable {
}

final class AppHomeRouter: ViewableRouter<AppHomeInteractable, AppHomeViewControllable>, AppHomeRouting {
    
    private let topupBuildable : TopupBuildable
    private var topupRouting : Routing?
    
    private let albumBuildable : AlbumHomeBuildable
    private var albumRouting : Routing?
    
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AppHomeInteractable,
         viewController: AppHomeViewControllable,
         topupBuildable : TopupBuildable,
         albumBuildable : AlbumHomeBuildable
    ){
        self.albumBuildable = albumBuildable
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachTopup() {
        if topupRouting != nil{
            return
        }
        let router = topupBuildable.build(withListener: interactor)
        topupRouting = router
        attachChild(router)
    }
    func attachAlbum() {
        if albumRouting != nil {
            return
        }
        let router = albumBuildable.build(withListener: interactor)
        viewController.pushViewController(router.viewControllable, animated: true)
        albumRouting = router
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

    func detachAlbum() {
        guard let router = albumRouting else{
            return
        }
        viewController.popToRoot(animated: true)
        detachChild(router)
        self.albumRouting = nil
    }
    
    
}
