//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import UIUtil
import RIBsUtil

protocol ChooseImageInteractable: Interactable , TopupListener{
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {

    

    private let topupBuildable : TopupBuildable
    private var topupRouting : Routing?
    
    init(
        interactor: ChooseImageInteractable,
        viewController: ChooseImageViewControllable,
        topupBuildable : TopupBuildable
    ) {
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachTopup(originerPictureStatus  : Bool) {
        if topupRouting != nil {
            return
        }
        let router = topupBuildable.build(
            withListener: interactor,
            originerPictureStatus: originerPictureStatus)
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
