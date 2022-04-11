//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import UIUtil
import RIBsUtil
import UIKit
import Loading
import ImageVerification

protocol ChooseImageInteractable: Interactable , LoadingModalListener, ImageVerificationListener{
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {


    private let loadingModalBuidable : LoadingModalBuildable
    private var loadingModalRouting : Routing?
    
    private let imageVerificationBuildable: ImageVerificationBuildable
    private var imageVerificationRouting : Routing?
    
    init(
        interactor: ChooseImageInteractable,
        viewController: ChooseImageViewControllable,
        loadingModalBuidable : LoadingModalBuildable,
        imageVerificationBuildable : ImageVerificationBuildable
    ) {
        self.imageVerificationBuildable = imageVerificationBuildable
        self.loadingModalBuidable = loadingModalBuidable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachLoading(originerImage: UIImage, pieceImage: UIImage) {
        if loadingModalRouting != nil{
            return
        }
        let router = loadingModalBuidable.build(
            withListener: interactor,
            originerImage: originerImage,
            pieceImage: pieceImage
        )
        presentWithPushModal(router.viewControllable, animated: false)
        attachChild(router)
        self.loadingModalRouting = router
    }
    
    func attachImageVerification(image: UIImage) {
        if imageVerificationRouting != nil{
            return
        }
        let router = imageVerificationBuildable.build(withListener: interactor, withImage: image, withState: false)
        let navigation = NavigationControllerable(root: router.viewControllable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewControllable.present(navigation, animated: true, completion: nil)
        
        imageVerificationRouting = router
        attachChild(router)
    }
    
    //MARK: - Detach
    func detachLoading() {
        guard let router = loadingModalRouting else {
            return
        }
        viewControllable.dismiss(animated: false, completion: nil)
        detachChild(router)
        loadingModalRouting = nil
    }
    
    func detachImageVerification() {
        guard let router = imageVerificationRouting else{
            return
        }
        viewControllable.dismiss(animated: true, completion: nil)

        detachChild(router)
        imageVerificationRouting = nil
    }
    
    func detachImagePresenter() {
        guard let router = imageVerificationRouting else{
            return
        }

        detachChild(router)
        imageVerificationRouting = nil
    }
    
    
    //MARK: - Present Action
    private func presentWithPushModal(_ viewControllable: ViewControllable, animated : Bool){
        viewControllable.uiviewController.modalPresentationStyle = .custom
        viewController.present(viewControllable, animated: animated, completion: nil)
    }
}
