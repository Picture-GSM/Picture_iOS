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
    func attachTopup(cameraStatus : Bool)
    func detachTopup()
    
}

protocol ChooseImagePresentable: Presentable {
    var listener: ChooseImagePresentableListener? { get set }
}

protocol ChooseImageListener: AnyObject {
    func transportHomeDidClose()
}

final class ChooseImageInteractor: PresentableInteractor<ChooseImagePresentable>, ChooseImageInteractable, ChooseImagePresentableListener {
    

    weak var router: ChooseImageRouting?
    weak var listener: ChooseImageListener?
    

    override init(presenter: ChooseImagePresentable) {
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
    
    func didTapCamera() {
        router?.attachTopup(cameraStatus: true)
    }
    
    func didTapPhotoLibrary() {
        router?.attachTopup(cameraStatus: false)
    }
    
    func topupDidClose() {
        router?.detachTopup()
    }
    
    func topupDidFinish() {
        router?.detachTopup()
    }
    
}
