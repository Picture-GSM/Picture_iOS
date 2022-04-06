//
//  ChooseImageRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import UIUtil
import RIBsUtil

protocol ChooseImageInteractable: Interactable {
    var router: ChooseImageRouting? { get set }
    var listener: ChooseImageListener? { get set }
}

protocol ChooseImageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ChooseImageRouter: ViewableRouter<ChooseImageInteractable, ChooseImageViewControllable>, ChooseImageRouting {

    
    override init(
        interactor: ChooseImageInteractable,
        viewController: ChooseImageViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

}
