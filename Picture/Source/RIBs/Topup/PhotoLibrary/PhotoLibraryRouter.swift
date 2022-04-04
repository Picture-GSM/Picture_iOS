//
//  PhotoLibraryRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
import UIKit

protocol PhotoLibraryInteractable: Interactable, DecideImageListener {
    var router: PhotoLibraryRouting? { get set }
    var listener: PhotoLibraryListener? { get set }
}

protocol PhotoLibraryViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class PhotoLibraryRouter: ViewableRouter<PhotoLibraryInteractable, PhotoLibraryViewControllable>, PhotoLibraryRouting {

    private var navigationControllable: NavigationControllerable?
    
    private let decideImageBuildable : DecideImageBuildable
    private var decideImageRouting : Routing?
    
    init(
        interactor: PhotoLibraryInteractable,
        viewController: PhotoLibraryViewControllable,
        decideImageBuildable : DecideImageBuildable
    ) {
        self.decideImageBuildable = decideImageBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachDecidePhotoLibraryImage(_ image: UIImage) {
        if decideImageRouting != nil{
            return
        }
        let router = decideImageBuildable.build(withListener: interactor, image: image)
        
        
        decideImageRouting = router
        attachChild(router)
    }
    
}
