//
//  ChooseImageInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil
import UIKit

protocol ChooseImageRouting: ViewableRouting {
    func attachLoading()
    func detachLoading()
    
    func attachImageVerification()
    func detachImageVerification()
}

protocol ChooseImagePresentable: Presentable {
    var listener: ChooseImagePresentableListener? { get set }
    
}

protocol ChooseImageListener: AnyObject {
    func transportHomeDidClose()
}

final class ChooseImageInteractor: PresentableInteractor<ChooseImagePresentable>, ChooseImageInteractable, ChooseImagePresentableListener,AdaptivePresentationControllerDelegate{

    weak var router: ChooseImageRouting?
    weak var listener: ChooseImageListener?
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy


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

    //MARK: - Action
    func didTapBack() {
        listener?.transportHomeDidClose()
    }

    func didTapStartButton() {
        router?.attachLoading()
    }
    //MARK: - Loading
    func didClearTrainingMachine() {
        router?.detachLoading()
        router?.attachImageVerification()
    }
    
    //MARK: - ImageVerification
    func didTapImageVerificationClose() {
        router?.detachImageVerification()
    }
    func didTapImageVerificationSaveSuccess() {
        router?.detachImageVerification()
        listener?.transportHomeDidClose()
    }
    
    
    //MARK: - presentationControllable
    func presetationControllerDidDismiss() {
        router?.detachImageVerification()
    }
    
}
