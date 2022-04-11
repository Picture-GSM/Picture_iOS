//
//  ListHomeRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import UIKit
import RIBsUtil
import UIUtil
import ImageVerification
import ListHome
import ImageRepository

protocol ListHomeInteractable: Interactable , ImageVerificationListener{
    var router: ListHomeRouting? { get set }
    var listener: ListHomeListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol ListHomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ListHomeRouter: ViewableRouter<ListHomeInteractable, ListHomeViewControllable>, ListHomeRouting {

    private let imageVerificationBuildable : ImageVerificationBuildable
    private var imageVerificationRouting : Routing?
    
    
    init(
        interactor: ListHomeInteractable,
        viewController: ListHomeViewControllable,
        imageVerifivationBuildable : ImageVerificationBuildable
    ) {
        self.imageVerificationBuildable = imageVerifivationBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Attach
    func attachImageVerification(id: String) {
        if imageVerificationRouting != nil{
            return
        }
        let router = imageVerificationBuildable.build(
            withListener: interactor,
            withImage: ImageDirectory.shared.loadImageFromDocumentDirecotry(imageName: "\(id).png") ?? UIImage(),
            withState: true
        )
        
        let navigation = NavigationControllerable(root: router.viewControllable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewControllable.present(navigation, animated: true, completion: nil)
        
        imageVerificationRouting = router
        attachChild(router)
    }
    func detachImageVerification() {
        guard let router = imageVerificationRouting else{
            return
        }
        viewControllable.dismiss(animated: true, completion: nil)

        detachChild(router)
        imageVerificationRouting = nil
    }
    
}
