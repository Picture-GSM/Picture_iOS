//
//  TopupInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs
import RxSwift
import UIUtil
import RIBsUtil
import Foundation

protocol TopupRouting: Routing {
    func cleanupViews()
    
    func attachCamera(closeButtonType: DismissButtonType)
    func detachCamera()
    
    func attachAlbum()
    func detachAlbum()
    
    func popToRoot()
}

protocol TopupListener: AnyObject {
    func topupDidClose()
    func topupDidFinish()
    
}

protocol TopupInteractorDependency{
    
}

final class TopupInteractor: Interactor, TopupInteractable, AdaptivePresentationControllerDelegate {

    
    
    //MARK: -  Properties
    weak var router: TopupRouting?
    weak var listener: TopupListener?
    
    let presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy
    
    private let dependency: TopupInteractorDependency
    
    private var isEnterAmountRoot: Bool = false
    
    init(
        dependency : TopupInteractorDependency
    ) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        self.dependency = dependency
        super.init()
        self.presentationDelegateProxy.delegate = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        router?.attachCamera(closeButtonType:.close)
    }
    
    override func willResignActive() {
        super.willResignActive()
        router?.cleanupViews()
    }
    
    func presetationControllerDidDismiss() {
        listener?.topupDidClose()
    }
    
    func transportHomeDidTapClose() {
        
    }
    
}
