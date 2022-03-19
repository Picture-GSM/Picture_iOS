//
//  CameraHomeInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs
import RxSwift

protocol CameraHomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CameraHomePresentable: Presentable {
    var listener: CameraHomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CameraHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CameraHomeInteractor: PresentableInteractor<CameraHomePresentable>, CameraHomeInteractable, CameraHomePresentableListener {

    weak var router: CameraHomeRouting?
    weak var listener: CameraHomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CameraHomePresentable) {
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
}
