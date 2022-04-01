//
//  TopupInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil

protocol TopupRouting: Routing {
    func cleanupViews()

    func attachCamera()
    func detachCamera()
    
    func attachPhotoLibrary()
    func detachPhotoLibrary()
}

protocol TopupListener: AnyObject {
    func topupDidClose()
    func topupDidFinish()
}

final class TopupInteractor: Interactor, TopupInteractable,AdaptivePresentationControllerDelegate {

    weak var router: TopupRouting?
    weak var listener: TopupListener?
    
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy
    
    override init() {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        super.init()
        self.presentationDelegateProxy.delegate = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.attachCamera()
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    func presetationControllerDidDismiss() {
        listener?.topupDidClose()
    }
}
