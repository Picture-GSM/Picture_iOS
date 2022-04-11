//
//  AppHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RIBsUtil
import UIUtil
import ChooseImage

protocol AppHomeInteractable: Interactable ,ChooseImageListener{
    var router: AppHomeRouting? { get set }
    var listener: AppHomeListener? { get set }
}

protocol AppHomeViewControllable: ViewControllable {
}

final class AppHomeRouter: ViewableRouter<AppHomeInteractable, AppHomeViewControllable>, AppHomeRouting {
    
    
    private let chooseImageBuildable : ChooseImageBuildable
    private var chooseImageRouting : Routing?
    private let transitioningDelegate : PushModalPresentationController
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AppHomeInteractable,
                  viewController: AppHomeViewControllable,
                  chooseImageBuildable : ChooseImageBuildable
    ){
        self.transitioningDelegate = PushModalPresentationController()
        self.chooseImageBuildable = chooseImageBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    func attachChooseImage() {
        if chooseImageRouting != nil{
            return
        }
        let router = chooseImageBuildable.build(withListener: interactor)
        presentWithPushTransition(router.viewControllable, animated: true)
        attachChild(router)
        self.chooseImageRouting = router
    }
    
    func detachChooseImage() {
        guard let router = chooseImageRouting else{
            return
        }
        
        viewController.dismiss(animated: true, completion: nil)
        self.chooseImageRouting = nil
        detachChild(router)
    }
    
    private func presentWithPushTransition(_  viewControllable: ViewControllable, animated: Bool){
        viewControllable.uiviewController.modalPresentationStyle = .custom
        viewControllable.uiviewController.transitioningDelegate = transitioningDelegate
        viewController.present(viewControllable, animated: true, completion: nil)
    }
}
