//
//  CameraInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift

protocol CameraRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CameraPresentable: Presentable {
    var listener: CameraPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CameraListener: AnyObject {
    func cameraDidTapClose()
}

final class CameraInteractor: PresentableInteractor<CameraPresentable>, CameraInteractable, CameraPresentableListener {

    
    weak var router: CameraRouting?
    weak var listener: CameraListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CameraPresentable) {
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
    
    func didTapCloseBtn() {
        listener?.cameraDidTapClose()
    }
    
}
