//
//  AppHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs

protocol AppHomeInteractable: Interactable , CameraHomeListener{
    var router: AppHomeRouting? { get set }
    var listener: AppHomeListener? { get set }
}

protocol AppHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppHomeRouter: ViewableRouter<AppHomeInteractable, AppHomeViewControllable>, AppHomeRouting {

    private let transportCameraBuildable: CameraHomeBuildable
    private var transportCameraRouting: Routing?
    private let transitioningDelegate: PushModalPresentationController

    // TODO: Constructor inject child builder protocols to allow building children.
     init(interactor: AppHomeInteractable,
          viewController: AppHomeViewControllable,
          transportCameraBuildable : CameraHomeBuildable
     ){
         self.transitioningDelegate = PushModalPresentationController()
        self.transportCameraBuildable =  transportCameraBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTransportHome() {
        if transportCameraRouting != nil{
            return
        }
        
        let router = transportCameraBuildable.build(withListener: interactor)
        presentWithPushTransition(router.viewControllable, animated: true)
        attachChild(router)
        self.transportCameraRouting = router
    }
    //MARK: - Push Transition
    private func presentWithPushTransition(_ viewControllable: ViewControllable, animated: Bool) {
      viewControllable.uiviewController.modalPresentationStyle = .custom
      viewControllable.uiviewController.transitioningDelegate = transitioningDelegate
      viewController.present(viewControllable, animated: true, completion: nil)
    }
}
