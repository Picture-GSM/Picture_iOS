//
//  TopupRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs
import UIUtil
import RIBsUtil

protocol TopupInteractable: Interactable , CameraHomeListener, AlbumHomeListener{
    var router: TopupRouting? { get set }
    var listener: TopupListener? { get set }
    var presentationDelegateProxy : AdaptivePresentationControllerDelegateProxy {get}
}

protocol TopupViewControllable: ViewControllable {
    
}

final class TopupRouter: Router<TopupInteractable>, TopupRouting {

    private var navigationControllable : NavigationControllerable?
    
    private let cameraBuildable : CameraHomeBuildable
    private var cameraRouting : Routing?
    
    private let albumBuildable : AlbumHomeBuildable
    private var albumRouting : Routing?
    
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: TopupInteractable,
        viewController: ViewControllable,
        cameraBuildable : CameraHomeBuildable,
        albumBuildable : AlbumHomeBuildable
    ) {
        self.viewController = viewController
        self.cameraBuildable = cameraBuildable
        self.albumBuildable = albumBuildable
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    func cleanupViews() {
        if viewController.uiviewController.presentedViewController != nil, navigationControllable != nil{
            navigationControllable?.dismiss(completion: nil)
        }
    }
    
    func attachCamera(closeButtonType: DismissButtonType) {
        if cameraRouting != nil{
            return
        }
        let router = cameraBuildable.build(withListener: interactor)
        
        if let navigationControllable = navigationControllable{
            navigationControllable.pushViewController(router.viewControllable, animated: true)
        }else{
            presentInsideNavigation(router.viewControllable)
        }
        attachChild(router)
        cameraRouting = router
    }
    
    func detachCamera() {
        guard let router = cameraRouting else{
            return
        }
        navigationControllable?.popViewController(animated: true)
        detachChild(router)
        cameraRouting = nil
    }
    
    func attachAlbum() {
        if albumRouting != nil {
            return
        }
        let router = albumBuildable.build(withListener: interactor)
        if let navigationControllable = navigationControllable {
            navigationControllable.setViewControllers([router.viewControllable])
            resetChildRouting()
        }else{
            presentInsideNavigation(router.viewControllable)
        }
        attachChild(router)
        albumRouting = router
    }
    
    func detachAlbum() {
        guard let router = albumRouting else{
            return
        }
        dismissPresentedNavigation(completion: nil)
        detachChild(router)
        albumRouting = nil
    }
    
    func popToRoot() {
        navigationControllable?.popToRoot(animated: true)
        resetChildRouting()
    }
    
    private func presentInsideNavigation(_ viewControllable: ViewControllable) {
      let navigation = NavigationControllerable(root: viewControllable)
      navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
      self.navigationControllable = navigation
      viewController.present(navigation, animated: true, completion: nil)
    }
    
    
    private func dismissPresentedNavigation(completion: (() -> Void)?){
        if self.navigationControllable == nil {
          return
        }
        
        viewController.dismiss(completion: nil)
        self.navigationControllable = nil
      }
    
    private func resetChildRouting(){
        if let cameraRouting = cameraRouting {
            detachChild(cameraRouting)
            self.cameraRouting = nil
        }
        if let albumRouting = albumRouting {
            detachChild(albumRouting)
            self.albumRouting = nil
        }
    }
    
    // MARK: - Private
    
    private let viewController: ViewControllable
}
