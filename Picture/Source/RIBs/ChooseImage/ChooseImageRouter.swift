//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import UIUtil
import RIBsUtil

protocol ChooseImageInteractable: Interactable , TopupListener, PhotoLibraryListener{
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
    var presentationDelegateProxy  : AdaptivePresentationControllerDelegateProxy {get}
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {
    
    private let photoLibraryBuildable : PhotoLibraryBuildable
    private var photoLibraryRouting : Routing?
    
    private let topupBuildable : TopupBuildable
    private var topupRouting : Routing?
    
    init(
        interactor: ChooseImageInteractable,
        viewController: ChooseImageViewControllable,
        topupBuildable : TopupBuildable,
        photoLibraryBuildable : PhotoLibraryBuildable
    ) {
        self.photoLibraryBuildable = photoLibraryBuildable
        self.topupBuildable = topupBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachTopup() {
        if topupRouting != nil {
            return
        }
        let router = topupBuildable.build(withListener: interactor)
        topupRouting = router
        attachChild(router)
    }
    
    func attachPhotoLibrary() {
        if photoLibraryRouting != nil{
            return
        }
        let router = photoLibraryBuildable.build(withListener: interactor, closeButtonType: .close)
        
        let navigation = NavigationControllerable(root: router.viewControllable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewControllable.present(navigation, animated: true, completion: nil)
        
        photoLibraryRouting = router
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
    
    func detachPhotoLibrary() {
        guard let router = photoLibraryRouting else{
            return
        }
        
        viewControllable.dismiss(completion: nil)
        
        detachChild(router)
        photoLibraryRouting = nil
    }
    
    func detachPhotoLibraryAdptive() {
        guard let router = photoLibraryRouting else{
            return
        }
                
        detachChild(router)
        photoLibraryRouting = nil
    }
}
