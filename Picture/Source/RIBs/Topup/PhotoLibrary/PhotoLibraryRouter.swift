//
//  PhotoLibraryRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
import UIKit

protocol PhotoLibraryInteractable: Interactable {
    var router: PhotoLibraryRouting? { get set }
    var listener: PhotoLibraryListener? { get set }
}

protocol PhotoLibraryViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class PhotoLibraryRouter: ViewableRouter<PhotoLibraryInteractable, PhotoLibraryViewControllable>, PhotoLibraryRouting {
    

    override init(
        interactor: PhotoLibraryInteractable,
        viewController: PhotoLibraryViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
