//
//  TopupInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil
import UIKit

protocol TopupRouting: Routing {
    func cleanupViews()

    func attachCamera()
    func detachCamera()
    
    func attachPhotoLibrary()
    func detachPhotoLibrary()
    
    func attachDecideImage(_ image : UIImage)
    func detachDecideImage()
    
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
//        router?.attachPhotoLibrary()
    }
    
    override func willResignActive() {
        super.willResignActive()
        router?.cleanupViews()
    }
    func presetationControllerDidDismiss() {
        listener?.topupDidClose()
    }
    func cameraDidTapClose() {
        router?.detachCamera()
        listener?.topupDidClose()
    }
    func photoLibraryTransportTap() {
        router?.attachPhotoLibrary()
    }
    func didPhotoLibraryDidTapClose() {
        router?.detachPhotoLibrary()
    }

    
}
