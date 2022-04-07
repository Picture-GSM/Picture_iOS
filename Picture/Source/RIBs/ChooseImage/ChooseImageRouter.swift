//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import UIUtil
import RIBsUtil

protocol ChooseImageInteractable: Interactable , LoadingModalListener{
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {

    

    private let loadingModalBuidable : LoadingModalBuildable
    private var loadingModalRouting : LoadingModalRouting?
    
    init(
        interactor: ChooseImageInteractable,
        viewController: ChooseImageViewControllable,
        loadingModalBuidable : LoadingModalBuildable
    ) {
        self.loadingModalBuidable = loadingModalBuidable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachLoading() {
        if loadingModalRouting != nil{
            return
        }
        let router = loadingModalBuidable.build(withListener: interactor)
        presentWithPushModal(router.viewControllable, animated: false)
        attachChild(router)
        self.loadingModalRouting = router
    }
    //MARK: - Detach
    func detachLoading() {
        guard let router = loadingModalRouting else {
            return
        }
        viewControllable.dismiss(animated: false, completion: nil)
        loadingModalRouting = nil
        detachChild(router)
    }
    
    //MARK: - Present Action
    private func presentWithPushModal(_ viewControllable: ViewControllable, animated : Bool){
        viewControllable.uiviewController.modalPresentationStyle = .custom
        viewController.present(viewControllable, animated: animated, completion: nil)
    }
}
