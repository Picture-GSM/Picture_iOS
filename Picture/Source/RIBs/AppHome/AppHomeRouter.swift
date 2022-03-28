//
//  AppHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RIBsUtil
import UIUtil

protocol AppHomeInteractable: Interactable , CameraHomeListener, AlbumHomeListener{
    var router: AppHomeRouting? { get set }
    var listener: AppHomeListener? { get set }
}

protocol AppHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppHomeRouter: ViewableRouter<AppHomeInteractable, AppHomeViewControllable>, AppHomeRouting {

    private let transportCameraBuildable: CameraHomeBuildable
    private let transportAlbumBuildable : AlbumHomeBuildable
    private var transportCameraRouting: Routing?
    private let transitioningDelegate: PushModalPresentationController

    // TODO: Constructor inject child builder protocols to allow building children.
     init(interactor: AppHomeInteractable,
          viewController: AppHomeViewControllable,
          transportCameraBuildable : CameraHomeBuildable,
          transportAlbumBuildable : AlbumHomeBuildable
     ){
         self.transitioningDelegate = PushModalPresentationController()
         self.transportAlbumBuildable = transportAlbumBuildable
         self.transportCameraBuildable =  transportCameraBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTransportCamera() {
        if transportCameraRouting != nil{
            return
        }
        
        let router = transportCameraBuildable.build(withListener: interactor)
        presentWithPushTransition(router.viewControllable, animated: true)
        attachChild(router)
        self.transportCameraRouting = router
    }
    
    func attachTransportAlbum() {
        if transportCameraRouting != nil{
            return
        }
        
        let router = transportAlbumBuildable.build(withListener: interactor)
        presentWithPushTransition(router.viewControllable, animated: true)
        attachChild(router)
        self.transportCameraRouting = router
    }
    func detachTransportHome() {
        guard let router = transportCameraRouting else{
            return
        }
        
        viewController.dismiss(completion: nil)
        self.transportCameraRouting = nil
        detachChild(router)
    }
    //MARK: - Push Transition
    private func presentWithPushTransition(_ viewControllable: ViewControllable, animated: Bool) {
      viewControllable.uiviewController.modalPresentationStyle = .custom
      viewControllable.uiviewController.transitioningDelegate = transitioningDelegate
      viewController.present(viewControllable, animated: true, completion: nil)
    }
}
