//
//  ChooseImageInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil

protocol ChooseImageRouting: ViewableRouting {
    func attachTopup()
    func detachTopup()
}

protocol ChooseImagePresentable: Presentable {
    var listener: ChooseImagePresentableListener? { get set }
}

protocol ChooseImageListener: AnyObject {
    func transportHomeDidClose()
}

final class ChooseImageInteractor: PresentableInteractor<ChooseImagePresentable>, ChooseImageInteractable, ChooseImagePresentableListener, AdaptivePresentationControllerDelegate {




    weak var router: ChooseImageRouting?
    weak var listener: ChooseImageListener?
    
    let presentationDelegateProxy : AdaptivePresentationControllerDelegateProxy

    override init(presenter: ChooseImagePresentable) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapBack() {
        listener?.transportHomeDidClose()
    }
    
    func didTapOriginerImageButton() {
        router?.attachTopup()
    }
    
    func didTapPieceImageButton() {
        router?.attachTopup()
    }
    func topupDidClose() {
        router?.detachTopup()
    }
    
    func topupDidFinish() {
        router?.detachTopup()
    }
    
    
    func presetationControllerDidDismiss() {
        router?.detachTopup()
    }
}
