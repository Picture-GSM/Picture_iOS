//
//  TopupInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
import RxSwift
import UIUtil
import UIKit

protocol TopupRouting: Routing {
    func cleanupViews()

    func attachCamera()
    func detachCamera()
    
    func attachDecideImage(_ image : UIImage)
    func detachDecideImage()
    
    func popToRoot()

}

protocol TopupListener: AnyObject {
    func topupDidClose()
    func topupDidFinish()

    func setOriginerPicture(image : UIImage)
    func setPiecePicture(image : UIImage)
}

final class TopupInteractor: Interactor, TopupInteractable,AdaptivePresentationControllerDelegate {



    weak var router: TopupRouting?
    weak var listener: TopupListener?
    
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy
       
    private var originerPictureStatus : Bool
    
    init(
        originerPictureStatus : Bool
    ) {
        self.originerPictureStatus = originerPictureStatus
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
    }
    func presetationControllerDidDismiss() {
        listener?.topupDidClose()
    }
    func cameraDidTapClose() {
        listener?.topupDidClose()
        router?.detachCamera()
    }
    func cameraDidTapTakePicture(_ image: UIImage) {
        router?.attachDecideImage(image)
    }
    
    func didPhotoLibraryDidTapClose() {
        listener?.topupDidClose()
        
    }
    func didDecideImageDidTap(image : UIImage) {
        router?.attachDecideImage(image)
    }
    func didTapClose() {
        router?.detachDecideImage()
    }
    func didTapSave(image: UIImage) {
        listener?.topupDidFinish()
        if originerPictureStatus{
            listener?.setOriginerPicture(image: image)
        }else{
            listener?.setPiecePicture(image: image)
        }
    }

    
    
}
