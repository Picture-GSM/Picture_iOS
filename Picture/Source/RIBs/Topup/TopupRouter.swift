//
//  TopupRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
import UIUtil

protocol TopupInteractable: Interactable , CameraListener, PhotoLibraryListener{
    var router: TopupRouting? { get set }
    var listener: TopupListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }

}

protocol TopupViewControllable: ViewControllable {
    
}

final class TopupRouter: Router<TopupInteractable>, TopupRouting {
    
    private var navigationControllable : NavigationControllerable?
    
    private let cameraBuildable : CameraBuildable
    private var cameraRouting : Routing?
    
    private let photoLibraryBuildable : PhotoLibraryBuildable
    private var photoLibraryRouting : Routing?
    
    init(
        interactor: TopupInteractable,
        viewController: ViewControllable,
        cameraBuildable : CameraBuildable,
        photoLibraryBuildable : PhotoLibraryBuildable
    ) {
        self.cameraBuildable = cameraBuildable
        self.photoLibraryBuildable = photoLibraryBuildable
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        if viewController.uiviewController.presentedViewController != nil, navigationControllable != nil{
            navigationControllable?.dismiss(completion: nil)
        }
    }
    
    //MARK: - Attach
    func attachCamera() {
        if cameraRouting != nil{
            return
        }
        
        let router = cameraBuildable.build(withListener: interactor)
        
        if let navigationControllable = navigationControllable {
            navigationControllable.pushViewController(router.viewControllable, animated: true)
        }else{
            presentInsideNavigation(router.viewControllable)
        }
        attachChild(router)
        cameraRouting = nil
    }
    func attachPhotoLibrary() {
        if photoLibraryRouting != nil{
            return
        }
        let router = photoLibraryBuildable.build(withListener: interactor)
        
        if let navigationControllable = navigationControllable {
            navigationControllable.pushViewController(router.viewControllable, animated: true)
            resetChildRouting()
        }else{
            presentInsideNavigation(router.viewControllable)
        }
        attachChild(router)
        photoLibraryRouting = nil
    }
    
    
    //MARK: - Detach
    func detachCamera() {
        guard let router = cameraRouting else {
            return
        }
        
        navigationControllable?.popViewController(animated: true)
        detachChild(router)
        cameraRouting = nil
    }
    func detachPhotoLibrary() {
        guard let router = cameraRouting else {
          return
        }
        
        dismissPresentedNavigation(completion: nil)
        detachChild(router)
        cameraRouting = nil
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
    
    private func dismissPresentedNavigation(completion : (()->Void)?){
        if self.navigationControllable == nil{
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
        if let photoLibraryRouting = photoLibraryRouting {
            detachChild(photoLibraryRouting)
            self.photoLibraryRouting = nil
        }
    }
    // MARK: - Private

    private let viewController: ViewControllable
}
